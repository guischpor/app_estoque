import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/card_stock_product.dart';
import '../controller/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../../../core/routes/named_routes.dart';
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
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    getAllStocksProducts();
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
                      homeController.pendingStockProducts.isEmpty
                          ? const Center(
                              child: ValidationMessage(
                                message: 'Nenhum registro cadastrado.',
                                icon: Icons.info,
                              ),
                            )
                          : _pending(homeController.pendingStockProducts),
                      homeController.shippedStockProducts.isEmpty
                          ? const Center(
                              child: ValidationMessage(
                                message: 'Nenhum registro cadastrado.',
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: pendings.length,
      itemBuilder: (_, index) {
        final pending = pendings[index];
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: shippeds.length,
      itemBuilder: (_, index) {
        final shipped = shippeds[index];
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
