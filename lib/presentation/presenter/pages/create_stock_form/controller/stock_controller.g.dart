// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockController on StockBase, Store {
  late final _$stockProductAtom =
      Atom(name: 'StockBase.stockProduct', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'StockBase.isLoading', context: context);

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
      Atom(name: 'StockBase.isSuccess', context: context);

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

  late final _$createStockProductAsyncAction =
      AsyncAction('StockBase.createStockProduct', context: context);

  @override
  Future<void> createStockProduct(
      {required BuildContext context,
      required String unitStore,
      required String date,
      required String userID,
      required int statusID}) {
    return _$createStockProductAsyncAction.run(() => super.createStockProduct(
        context: context,
        unitStore: unitStore,
        date: date,
        userID: userID,
        statusID: statusID));
  }

  late final _$updateStockProductAsyncAction =
      AsyncAction('StockBase.updateStockProduct', context: context);

  @override
  Future<void> updateStockProduct(
      {required BuildContext context,
      required String unitStore,
      required String date,
      required String userID,
      required int statusID,
      required String listID}) {
    return _$updateStockProductAsyncAction.run(() => super.updateStockProduct(
        context: context,
        unitStore: unitStore,
        date: date,
        userID: userID,
        statusID: statusID,
        listID: listID));
  }

  late final _$StockBaseActionController =
      ActionController(name: 'StockBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$StockBaseActionController.startAction(name: 'StockBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$StockBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccess(bool value) {
    final _$actionInfo =
        _$StockBaseActionController.startAction(name: 'StockBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$StockBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stockProduct: ${stockProduct},
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
