import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../widgets/show_snackbar_dialog.dart';
import '../../../../domain/entities/stock_product.dart';
import '../../../../../core/utils/date_input_converter.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';
import 'package:app_estoque/presentation/domain/usecases/get_product_item_usecase/get_product_item_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/add_product_item_usecase/add_product_item_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/update_product_item_usecase/update_product_item_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/delete_product_item_usecase/delete_product_item_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/get_all_products_item_usecase/get_all_products_item_usecase.dart';

part 'stock_detail_controller.g.dart';

class StockDetailController = StockDetailBase with _$StockDetailController;

abstract class StockDetailBase with Store {
  final AddProductItemUseCase addProductItemUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;
  final DeleteProductItemUseCase deleteProductItemUseCase;
  final GetProductItemUseCase getProductItemUseCase;
  final UpdateProductItemUseCase updateProductItemUseCase;

  StockDetailBase({
    required this.addProductItemUseCase,
    required this.getAllProductsUseCase,
    required this.deleteProductItemUseCase,
    required this.getProductItemUseCase,
    required this.updateProductItemUseCase,
  });

  @observable
  StockProductEntity stockProduct = StockProductEntity();

  @observable
  List<ProductEntity> productsItem = [];

  @observable
  ProductEntity product = ProductEntity();

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSuccess(bool value) {
    isSuccess = value;
  }

  @action
  Future<void> addProductItem({
    required BuildContext context,
    required String listID,
    required String userID,
    required String barCode,
    required String title,
    required String quantity,
    required String quantityPackaging,
    required String expirationDate,
  }) async {
    final dataConverter =
        DateInputConverter().convertStringToFormDate(expirationDate);

    final product = ProductEntity(
      stockID: listID,
      userID: userID,
      barCode: barCode,
      title: title,
      quantity: quantity,
      quantityPackaging: quantityPackaging,
      expirationDate: dataConverter,
    );

    final result = await addProductItemUseCase.call(product);

    result.fold(
      (error) {
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        print(success);
        setLoading(false);
        setSuccess(true);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Sucesso',
            label: 'Produto salvo com sucesso',
            icon: Icons.check,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
      },
    );
  }

  @action
  Future<void> getAllProductItems(BuildContext context) async {
    productsItem.clear();

    final result = await getAllProductsUseCase.call();

    result.fold(
      (error) {
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        productsItem.clear();
        productsItem = success;
        setLoading(false);
        setSuccess(true);
      },
    );
  }

  Future<void> deleteStockProduct(BuildContext context, String stockID) async {
    final result = await deleteProductItemUseCase.call(stockID);

    result.fold(
      (error) {
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        setLoading(false);
        setSuccess(true);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Sucesso',
            label: 'Produto excluido com sucesso',
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
        getAllProductItems(context);
      },
    );
  }

  Future<void> getProductItem(BuildContext context, String productID) async {
    final result = await getProductItemUseCase.call(productID);

    result.fold(
      (error) {
        print(error.toString());
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        product = success;
        setLoading(false);
        setSuccess(true);
      },
    );
  }

  @action
  Future<void> updateProductItem({
    required BuildContext context,
    required String userID,
    required String stockID,
    required String productID,
    required String barCode,
    required String title,
    required String quantity,
    required String quantityPackaging,
    required String expirationDate,
    required String createdAt,
    required String updatedAt,
  }) async {
    final dataConverter =
        DateInputConverter().convertStringToFormDate(expirationDate);

    final productItem = ProductEntity(
      id: productID,
      stockID: stockID,
      userID: userID,
      barCode: barCode,
      title: title,
      quantity: quantity,
      quantityPackaging: product.quantityPackaging,
      expirationDate: dataConverter,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    final result = await updateProductItemUseCase.call(productItem);

    result.fold(
      (error) {
        isLoading = false;
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        setLoading(false);
        setSuccess(true);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Sucesso',
            label: 'Produto alterado com sucesso',
            icon: Icons.check,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
      },
    );
  }
}
