// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockDetailController on StockDetailBase, Store {
  late final _$stockProductAtom =
      Atom(name: 'StockDetailBase.stockProduct', context: context);

  @override
  StockProductEntity get stockProduct {
    _$stockProductAtom.reportRead();
    return super.stockProduct;
  }

  @override
  set stockProduct(StockProductEntity value) {
    _$stockProductAtom.reportWrite(value, super.stockProduct, () {
      super.stockProduct = value;
    });
  }

  late final _$productsItemAtom =
      Atom(name: 'StockDetailBase.productsItem', context: context);

  @override
  List<ProductEntity> get productsItem {
    _$productsItemAtom.reportRead();
    return super.productsItem;
  }

  @override
  set productsItem(List<ProductEntity> value) {
    _$productsItemAtom.reportWrite(value, super.productsItem, () {
      super.productsItem = value;
    });
  }

  late final _$productAtom =
      Atom(name: 'StockDetailBase.product', context: context);

  @override
  ProductEntity get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductEntity value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'StockDetailBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSuccessAtom =
      Atom(name: 'StockDetailBase.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$addProductItemAsyncAction =
      AsyncAction('StockDetailBase.addProductItem', context: context);

  @override
  Future<void> addProductItem(
      {required BuildContext context,
      required String listID,
      required String userID,
      required String barCode,
      required String title,
      required String quantity,
      required String quantityPackaging,
      required String expirationDate}) {
    return _$addProductItemAsyncAction.run(() => super.addProductItem(
        context: context,
        listID: listID,
        userID: userID,
        barCode: barCode,
        title: title,
        quantity: quantity,
        quantityPackaging: quantityPackaging,
        expirationDate: expirationDate));
  }

  late final _$getAllProductItemsAsyncAction =
      AsyncAction('StockDetailBase.getAllProductItems', context: context);

  @override
  Future<void> getAllProductItems(BuildContext context) {
    return _$getAllProductItemsAsyncAction
        .run(() => super.getAllProductItems(context));
  }

  late final _$StockDetailBaseActionController =
      ActionController(name: 'StockDetailBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$StockDetailBaseActionController.startAction(
        name: 'StockDetailBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$StockDetailBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$StockDetailBaseActionController.startAction(
        name: 'StockDetailBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$StockDetailBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stockProduct: ${stockProduct},
productsItem: ${productsItem},
product: ${product},
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
