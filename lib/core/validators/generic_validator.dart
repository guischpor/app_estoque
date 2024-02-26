import '../services/value_object.dart';



class GenericValidator implements ValueObject {
  final String _value;

  GenericValidator(this._value);

  @override
  String? validator([Object? object]) {
    if (_value.trim().isEmpty) {
      return 'O campo é obrigatório!';
    }

    return null;
  }
}
