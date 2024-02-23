// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on SignUpBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SignUpBase.isLoading', context: context);

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
      Atom(name: 'SignUpBase.isObscure', context: context);

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

  late final _$isPasswordConfirmationObscureAtom =
      Atom(name: 'SignUpBase.isPasswordConfirmationObscure', context: context);

  @override
  bool get isPasswordConfirmationObscure {
    _$isPasswordConfirmationObscureAtom.reportRead();
    return super.isPasswordConfirmationObscure;
  }

  @override
  set isPasswordConfirmationObscure(bool value) {
    _$isPasswordConfirmationObscureAtom
        .reportWrite(value, super.isPasswordConfirmationObscure, () {
      super.isPasswordConfirmationObscure = value;
    });
  }

  late final _$nameAtom = Atom(name: 'SignUpBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$cpfAtom = Atom(name: 'SignUpBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$emailAtom = Atom(name: 'SignUpBase.email', context: context);

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
      Atom(name: 'SignUpBase.password', context: context);

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

  late final _$passwordConfirmationAtom =
      Atom(name: 'SignUpBase.passwordConfirmation', context: context);

  @override
  String get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  late final _$SignUpBaseActionController =
      ActionController(name: 'SignUpBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$SignUpBaseActionController.startAction(name: 'SignUpBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$SignUpBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure() {
    final _$actionInfo =
        _$SignUpBaseActionController.startAction(name: 'SignUpBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$SignUpBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordConfirmationObscure() {
    final _$actionInfo = _$SignUpBaseActionController.startAction(
        name: 'SignUpBase.setPasswordConfirmationObscure');
    try {
      return super.setPasswordConfirmationObscure();
    } finally {
      _$SignUpBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isObscure: ${isObscure},
isPasswordConfirmationObscure: ${isPasswordConfirmationObscure},
name: ${name},
cpf: ${cpf},
email: ${email},
password: ${password},
passwordConfirmation: ${passwordConfirmation}
    ''';
  }
}