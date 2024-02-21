abstract class CustomServerException implements Exception {
  final String message;

  CustomServerException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerBadRequest extends CustomServerException {
  ServerBadRequest() : super('Erro interno!.');
}
