import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/styles/app_text_style.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import '../../create_stock_form/controller/stock_controller.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import '../../stock_detail_product/controller/stock_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final String? productID;
  final String? listID;

  const ProductDetailPage({
    super.key,
    required this.productID,
    this.listID,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final stockDetailController = getIt<StockDetailController>();
  final stockController = getIt<StockController>();

  @override
  void initState() {
    super.initState();
    getProductItem();
  }

  void getProductItem() async {
    stockDetailController.setLoading(true);

    await stockDetailController.getProductItem(context, widget.productID!);

    if (stockDetailController.isSuccess) {
      stockDetailController.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return stockDetailController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: customAppBar(
                  context: context,
                  widget: Text(
                    stockDetailController.product.title ?? '',
                    style: AppTextStyle.nunitoWhite18.font24.bold,
                  ),
                  isLeading: true,
                  onTap: () {
                    context.goNamed(
                      NamedPaths.stockDetail,
                      pathParameters: {
                        'listID': widget.listID!,
                      },
                    );
                  },
                ),
                body: Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).longestSide * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildPresentation(
                        label: 'Nome',
                        text: stockDetailController.product.title ?? '',
                      ),
                      _buildPresentation(
                        label: 'Data de Validade',
                        text: DateTime.parse(
                                stockDetailController.product.expirationDate ??
                                    '')
                            .toStringDDMMYYYY(separator: '/'),
                      ),
                      _buildPresentation(
                        label: 'Código de Barras',
                        text: stockDetailController.product.barCode ?? '',
                      ),
                      _buildPresentation(
                        label: 'Quantidade por Embalagem',
                        text: stockDetailController.product.quantityPackaging ??
                            '',
                      ),
                      _buildPresentation(
                        label: 'Quantidade',
                        text: stockDetailController.product.quantity ?? '',
                      )
                    ],
                  ),
                ),
              );
      },
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
}
