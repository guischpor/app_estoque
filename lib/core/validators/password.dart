import '../services/value_object.dart';



class Password implements ValueObject {
  final String _value;

  Password(this._value);

  @override
  String? validator([Object? object]) {
    if (_value.trim().isEmpty) {
      return 'O campo de senha deve ser preenchido!';
    }

    if (_value.trim().length < 8) {
      return 'O campo de senha deve ter 8 caracteres!';
    }
    return null;
  }
}
