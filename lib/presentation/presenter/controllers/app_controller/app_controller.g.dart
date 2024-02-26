// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on AppBase, Store {
  late final _$isCheckLoggedAtom =
      Atom(name: 'AppBase.isCheckLogged', context: context);

  @override
  bool get isCheckLogged {
    _$isCheckLoggedAtom.reportRead();
    return super.isCheckLogged;
  }

  @override
  set isCheckLogged(bool value) {
    _$isCheckLoggedAtom.reportWrite(value, super.isCheckLogged, () {
      super.isCheckLogged = value;
    });
  }

  late final _$checkLoggedInAsyncAction =
      AsyncAction('AppBase.checkLoggedIn', context: context);

  @override
  Future<void> checkLoggedIn() {
    return _$checkLoggedInAsyncAction.run(() => super.checkLoggedIn());
  }

  late final _$setLoggedInAsyncAction =
      AsyncAction('AppBase.setLoggedIn', context: context);

  @override
  Future<void> setLoggedIn(bool value) {
    return _$setLoggedInAsyncAction.run(() => super.setLoggedIn(value));
  }

  late final _$AppBaseActionController =
      ActionController(name: 'AppBase', context: context);

  @override
  void setCheckLogged(bool value) {
    final _$actionInfo =
        _$AppBaseActionController.startAction(name: 'AppBase.setCheckLogged');
    try {
      return super.setCheckLogged(value);
    } finally {
      _$AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCheckLogged: ${isCheckLogged}
    ''';
  }
}
