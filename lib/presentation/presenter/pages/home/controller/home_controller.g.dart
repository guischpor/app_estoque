// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeBase.isLoading', context: context);

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
      Atom(name: 'HomeBase.isSuccess', context: context);

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

  late final _$stockProductsAtom =
      Atom(name: 'HomeBase.stockProducts', context: context);

  @override
  List<StockProductEntity> get stockProducts {
    _$stockProductsAtom.reportRead();
    return super.stockProducts;
  }

  @override
  set stockProducts(List<StockProductEntity> value) {
    _$stockProductsAtom.reportWrite(value, super.stockProducts, () {
      super.stockProducts = value;
    });
  }

  late final _$pendingStockProductsAtom =
      Atom(name: 'HomeBase.pendingStockProducts', context: context);

  @override
  List<StockProductEntity> get pendingStockProducts {
    _$pendingStockProductsAtom.reportRead();
    return super.pendingStockProducts;
  }

  @override
  set pendingStockProducts(List<StockProductEntity> value) {
    _$pendingStockProductsAtom.reportWrite(value, super.pendingStockProducts,
        () {
      super.pendingStockProducts = value;
    });
  }

  late final _$shippedStockProductsAtom =
      Atom(name: 'HomeBase.shippedStockProducts', context: context);

  @override
  List<StockProductEntity> get shippedStockProducts {
    _$shippedStockProductsAtom.reportRead();
    return super.shippedStockProducts;
  }

  @override
  set shippedStockProducts(List<StockProductEntity> value) {
    _$shippedStockProductsAtom.reportWrite(value, super.shippedStockProducts,
        () {
      super.shippedStockProducts = value;
    });
  }

  late final _$getAllStockProductsAsyncAction =
      AsyncAction('HomeBase.getAllStockProducts', context: context);

  @override
  Future<void> getAllStockProducts() {
    return _$getAllStockProductsAsyncAction
        .run(() => super.getAllStockProducts());
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccess(bool value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPendingStockProducts(List<StockProductEntity> value) {
    final _$actionInfo = _$HomeBaseActionController.startAction(
        name: 'HomeBase.setPendingStockProducts');
    try {
      return super.setPendingStockProducts(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShippedStockProducts(List<StockProductEntity> value) {
    final _$actionInfo = _$HomeBaseActionController.startAction(
        name: 'HomeBase.setShippedStockProducts');
    try {
      return super.setShippedStockProducts(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess},
stockProducts: ${stockProducts},
pendingStockProducts: ${pendingStockProducts},
shippedStockProducts: ${shippedStockProducts}
    ''';
  }
}
