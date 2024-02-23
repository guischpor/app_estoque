// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginBase.isLoading', context: context);

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

  late final _$isObscureAtom =
      Atom(name: 'LoginBase.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$isCheckedAtom =
      Atom(name: 'LoginBase.isChecked', context: context);

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  late final _$emailAtom = Atom(name: 'LoginBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$LoginBaseActionController =
      ActionController(name: 'LoginBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$LoginBaseActionController.startAction(name: 'LoginBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure() {
    final _$actionInfo =
        _$LoginBaseActionController.startAction(name: 'LoginBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChecked(bool? value) {
    final _$actionInfo =
        _$LoginBaseActionController.startAction(name: 'LoginBase.setChecked');
    try {
      return super.setChecked(value);
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isObscure: ${isObscure},
isChecked: ${isChecked},
email: ${email},
password: ${password}
    ''';
  }
}
