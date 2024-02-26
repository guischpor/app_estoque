import 'package:flutter/material.dart';
import '../widget/add_product_form.dart';
import 'package:go_router/go_router.dart';
import '../widget/card_product_item.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/styles/app_color.dart';
import '../controller/stock_detail_controller.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/styles/app_text_style.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../../core/services/user_service_local.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import '../../create_stock_form/controller/stock_controller.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_show_dialog.dart';
import 'package:app_estoque/presentation/presenter/widgets/validation_message.dart';

class StockDetailProductPage extends StatefulWidget {
  final String? listID;

  const StockDetailProductPage({
    super.key,
    required this.listID,
  });

  @override
  State<StockDetailProductPage> createState() => _StockDetailProductPageState();
}

class _StockDetailProductPageState extends State<StockDetailProductPage> {
  final stockDetailController = getIt<StockDetailController>();
  final stockController = getIt<StockController>();
  final userServiceLocal = getIt<UserServiceLocal>();

  UserEntity user = UserEntity();

  @override
  void initState() {
    super.initState();
    getStockProduct();
    getLocalUser();
    getAllProductsItem();
  }

  void getStockProduct() async {
    stockController.setLoading(true);

    await stockController.getStockProduct(context, widget.listID!);

    if (stockController.isSuccess) {
      stockController.setLoading(false);
    }
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

  void getAllProductsItem() async {
    stockDetailController.setLoading(true);

    await stockDetailController.getAllProductItems(context);

    if (stockDetailController.isSuccess) {
      stockDetailController.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final productByStockID = stockDetailController.productsItem
            .where(
              (product) => product.stockID == widget.listID,
            )
            .toList();

        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: customAppBar(
            context: context,
            widget: Text(
              'Detalhes do Estoque',
              style: AppTextStyle.nunitoWhite18.font24.bold,
            ),
            isLeading: true,
            onTap: () {
              context.go(NamedRoutes.home);
            },
          ),
          body: stockDetailController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.sizeOf(context).longestSide * 0.02,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.sizeOf(context).longestSide * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Itens do estoque',
                                style: AppTextStyle.nunitotBlack18.font16.bold,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        productByStockID.isEmpty
                            ? const ValidationMessage(
                                message: 'Nenhum produto cadastrado.',
                                icon: Icons.info,
                              )
                            : _buildProductItems(productByStockID),
                      ],
                    ),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.blue,
            onPressed: () async {
              context.goNamed(
                NamedPaths.addProductForm,
                pathParameters: {
                  'isAdd': 'true',
                  'isEdit': 'false',
                  'listID': widget.listID!,
                  'userID': user.id!,
                  'productID': 'null',
                },
              );
            },
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).longestSide * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPresentation(
            label: 'Data:',
            text: stockController.stockProduct.date != null
                ? DateTime.parse(stockController.stockProduct.date!)
                    .toStringDDMMYYYY()
                : '',
          ),
          _buildPresentation(
            label: 'Unidade:',
            text: stockController.stockProduct.unitStore != null
                ? stockController.stockProduct.unitStore!
                : '',
          ),
          _buildPresentation(
            label: 'Status:',
            text: stockController.stockProduct.statusID != null
                ? stockController.stockProduct.statusID! == 0
                    ? 'Pendente'
                    : 'Enviado'
                : '',
          ),
        ],
      ),
    );
  }

  Widget _buildPresentation({
    required String label,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).longestSide * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.nunitotBlack18.font15.bold,
          ),
          Text(
            text,
            style: AppTextStyle.nunitoGrey18.font15.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildProductItems(List<ProductEntity> productByStockID) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productByStockID.length,
      itemBuilder: (_, index) {
        final product = productByStockID[index];
        return CardProductItem(
          expirationDate: product.expirationDate ?? '',
          productName: product.title ?? '',
          quantity: product.quantity ?? '',
          onView: () {},
          onEdit: () {
            context.goNamed(
              NamedPaths.addProductForm,
              pathParameters: {
                'isAdd': 'false',
                'isEdit': 'true',
                'listID': widget.listID!,
                'userID': user.id!,
                'productID': product.id!,
              },
            );
          },
          onDelete: () => stockDetailController.deleteStockProduct(
            context,
            product.id!,
          ),
        );
      },
    );
  }
}
