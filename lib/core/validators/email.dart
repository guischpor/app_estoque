import '../services/value_object.dart';



class Email implements ValueObject {
  final String _value;

  Email(this._value);

  @override
  String? validator([Object? object]) {
    if (_value.trim().isEmpty) {
      return 'O campo de e-mail não pode ficar vazio!';
    }

    if (!_value.trim().contains(RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
      return 'O campo de e-mail deve conter @!';
    }
    return null;
  }
}
