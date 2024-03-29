import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/card_stock_product.dart';
import '../controller/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/services/user_service_local.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_drawer.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_app_bar.dart';
import 'package:app_estoque/presentation/presenter/widgets/validation_message.dart';
import 'package:app_estoque/presentation/presenter/controllers/app_controller/app_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final homeController = getIt<HomeController>();
  final appController = getIt<AppController>();
  final userServiceLocal = getIt<UserServiceLocal>();

  late final TabController _tabController;

  UserEntity user = UserEntity();

  @override
  void initState() {
    super.initState();
    getAllStocksProducts();
    getLocalUser();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void getLocalUser() async {
    final userHasLocal = await userServiceLocal.hasLocalUser();

    if (userHasLocal) {
      final userLocal = await userServiceLocal.getLocalUser();

      user = UserEntity(
        id: userLocal!.id,
        name: userLocal.name,
        email: userLocal.email,
        cpf: userLocal.cpf,
      );
    }
  }

  void getAllStocksProducts() async {
    homeController.setLoading(true);

    await homeController.getAllStockProducts();

    if (homeController.isSuccess) {
      homeController.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final pending = homeController.pendingStockProducts.where((element) {
          return element.userID == user.id;
        }).toList();

        final shipped = homeController.shippedStockProducts.where((element) {
          return element.userID == user.id;
        }).toList();
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: customAppBar(
            context: context,
            isLeading: false,
            bottom: TabBar(
              controller: _tabController,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.black.withOpacity(0.6),
              tabs: const [
                Tab(
                  text: 'Pendentes',
                  icon: Icon(Icons.pending_actions),
                ),
                Tab(
                  text: 'Enviados',
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
          drawer: const CustomDrawer(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.blue,
            onPressed: () async {
              context.goNamed(
                NamedPaths.createStockForm,
                pathParameters: {
                  'isAdd': 'true',
                  'isEdit': 'false',
                  'listID': 'null',
                },
              );
            },
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          body: homeController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      pending.isEmpty
                          ? const Center(
                              child: ValidationMessage(
                                message: 'Nenhum estoque cadastrado.',
                                icon: Icons.info,
                              ),
                            )
                          : _pending(homeController.pendingStockProducts),
                      shipped.isEmpty
                          ? const Center(
                              child: ValidationMessage(
                                message: 'Nenhum estoque cadastrado.',
                                icon: Icons.info,
                              ),
                            )
                          : _shipped(homeController.shippedStockProducts),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _pending(List<StockProductEntity> pendings) {
    final peddingByUser =
        pendings.where((element) => element.userID! == user.id).toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: peddingByUser.length,
      itemBuilder: (_, index) {
        final pending = peddingByUser[index];
        return CardStockProduct(
          date: pending.date!,
          unitNameStore: pending.unitStore!,
          statusID: pending.statusID!,
          onView: () {
            context.goNamed(
              NamedPaths.stockDetail,
              pathParameters: {
                'listID': pending.id!,
              },
            );
          },
          onEdit: () {
            context.goNamed(
              NamedPaths.createStockForm,
              pathParameters: {
                'isAdd': 'false',
                'isEdit': 'true',
                'listID': pending.id!,
              },
            );
          },
          onDelete: () => homeController.deleteStockProduct(
            context,
            pending.id!,
          ),
        );
      },
    );
  }

  Widget _shipped(List<StockProductEntity> shippeds) {
    final shippedsByUser =
        shippeds.where((element) => element.userID! == user.id).toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: shippedsByUser.length,
      itemBuilder: (_, index) {
        final shipped = shippedsByUser[index];
        return CardStockProduct(
          date: shipped.date!,
          unitNameStore: shipped.unitStore!,
          statusID: shipped.statusID!,
          onView: () {
            context.goNamed(
              NamedPaths.stockDetail,
              pathParameters: {
                'listID': shipped.id!,
              },
            );
          },
          onEdit: () {
            context.goNamed(
              NamedPaths.createStockForm,
              pathParameters: {
                'isAdd': 'false',
                'isEdit': 'true',
                'listID': shipped.id!,
              },
            );
          },
          onDelete: () => homeController.deleteStockProduct(
            context,
            shipped.id!,
          ),
        );
      },
    );
  }
}
