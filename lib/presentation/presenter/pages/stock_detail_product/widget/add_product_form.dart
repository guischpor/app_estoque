import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../core/styles/app_color.dart';
import '../controller/stock_detail_controller.dart';
import '../../../widgets/form/custom_text_form.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/styles/app_text_style.dart';
import '../../../widgets/custom_buttons/custom_button.dart';
import '../../../../../core/services/custom_date_picker.dart';
import 'package:app_estoque/core/extensions/app_extensions.dart';
import '../../create_stock_form/controller/stock_controller.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';

class AddProductForm extends StatefulWidget {
  final bool? isEdit;
  final bool? isAdd;
  final String? productID;
  final String? listID;
  final String? userID;

  const AddProductForm({
    super.key,
    this.isEdit = false,
    this.isAdd = false,
    this.productID,
    this.listID,
    this.userID,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final stockDetailController = getIt<StockDetailController>();
  final stockController = getIt<StockController>();

  final _barCodeController = TextEditingController();
  final _titleController = TextEditingController();
  final _quantityController = TextEditingController();
  final _quantityPackagingController = TextEditingController();
  final _expirationDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime datetimeNow = DateTime.now();

  @override
  void initState() {
    super.initState();

    if (widget.isEdit == true) {
      getProductItem();
    } else if (widget.isAdd == true) {
      _expirationDateController.text = datetimeNow.toStringDDMMYYYY();
    } else {
      print('Error');
    }
  }

  @override
  void dispose() {
    _barCodeController.dispose();
    _titleController.dispose();
    _quantityController.dispose();
    _quantityPackagingController.dispose();
    _expirationDateController.dispose();
    super.dispose();
  }

  void getProductItem() async {
    stockDetailController.setLoading(true);

    await stockDetailController.getProductItem(context, widget.productID ?? '');

    if (stockDetailController.isSuccess) {
      stockDetailController.setLoading(false);

      populateControllers(stockDetailController.product);
    }
  }

  Future<void> addProductItem() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await stockDetailController
        .addProductItem(
      context: context,
      listID: widget.listID!,
      userID: widget.userID!,
      barCode: _barCodeController.text,
      title: _titleController.text,
      quantity: _quantityController.text,
      quantityPackaging: _quantityPackagingController.text,
      expirationDate: _expirationDateController.text,
    )
        .then((value) {
      stockDetailController.getAllProductItems(context);
    });

    if (stockDetailController.isSuccess) {
      context.goNamed(
        NamedPaths.stockDetail,
        pathParameters: {
          'listID': widget.listID!,
        },
      );
    }
  }

  Future<void> updateProductItem() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    stockDetailController.setLoading(true);

    await stockDetailController
        .updateProductItem(
      context: context,
      stockID: widget.listID!,
      productID: widget.productID!,
      barCode: _barCodeController.text,
      title: _titleController.text,
      quantity: _quantityController.text,
      quantityPackaging: _quantityPackagingController.text,
      expirationDate: _expirationDateController.text,
      userID: widget.userID!,
      createdAt: stockDetailController.product.createdAt!,
      updatedAt: stockDetailController.product.updatedAt!,
    )
        .then((value) {
      stockDetailController.getAllProductItems(context);
    });

    if (stockDetailController.isSuccess) {
      context.goNamed(
        NamedPaths.stockDetail,
        pathParameters: {
          'listID': widget.listID!,
        },
      );
    }
  }

  void populateControllers(ProductEntity product) async {
    _titleController.text =
        product.title == '' || product.title == null ? '' : product.title!;

    _expirationDateController.text =
        product.expirationDate == '' || product.expirationDate == null
            ? ''
            : DateTime.parse(product.expirationDate!).toStringDDMMYYYY();

    _barCodeController.text = product.barCode == '' || product.barCode == null
        ? ''
        : product.barCode!;

    _quantityController.text =
        product.quantity == '' || product.quantity == null
            ? ''
            : product.quantity!;

    _quantityPackagingController.text =
        product.quantityPackaging == '' || product.quantityPackaging == null
            ? ''
            : product.quantityPackaging!;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return stockDetailController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: customAppBar(
                context: context,
                widget: Text(
                  widget.isEdit == true
                      ? 'Editar Produto'
                      : 'Adicionar Produto',
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
                  MediaQuery.sizeOf(context).longestSide * 0.02,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _form(),
                      CustomButton(
                        onPressed: () async => widget.isEdit == true
                            ? await updateProductItem()
                            : await addProductItem(),
                        label: widget.isEdit == true
                            ? 'EDITAR LISTA'
                            : 'CRIAR LISTA',
                        width: double.infinity,
                        fontSize: 15,
                        padding: const EdgeInsets.all(12),
                        backgroundColor: AppColors.blueLight,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.name,
              controller: _titleController,
              labelText: 'Nome do Produto',
              preffix: const Icon(
                Icons.shopping_basket_sharp,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Nome é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.datetime,
              controller: _expirationDateController,
              hintText: '${datetimeNow.toStringDDMMYYYY(separator: '/')}',
              labelText: 'Data de Validade',
              preffix: const Icon(
                Icons.calendar_today,
                color: AppColors.blueLight,
                size: 20,
              ),
              readOnly: true,
              onTap: () {
                CustomDatePicker().selectDate(
                  context: context,
                  controller: _expirationDateController,
                  format: 'date',
                );
              },
              validator: Validatorless.multiple([
                Validatorless.required('Data é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.name,
              controller: _barCodeController,
              labelText: 'Codigo de Barras',
              preffix: const Icon(
                Icons.qr_code_2,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Codigo de Barras é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.number,
              controller: _quantityPackagingController,
              labelText: 'Quantidade por Embalagem',
              preffix: const Icon(
                Icons.production_quantity_limits_sharp,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Quant Embalagem é obrigatório!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.number,
              controller: _quantityController,
              labelText: 'Quantidade',
              preffix: const Icon(
                Icons.format_list_numbered_rounded,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Quantidade é obrigatório!'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
