abstract class CustomServerException implements Exception {
  final String message;

  CustomServerException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerBadRequest extends CustomServerException {
  ServerBadRequest() : super('Erro interno!');
}

class BoxNotFound extends CustomServerException {
  BoxNotFound() : super('Box não encontrado!');
}

class StockNotFound extends CustomServerException {
  StockNotFound() : super('Produto Estoque não encontrado!');
}

class ProductNotFound extends CustomServerException {
  ProductNotFound() : super('Produto não encontrado!');
}

class UserNotFound extends CustomServerException {
  UserNotFound() : super('Usuário não foi encontrado!');
}

class EmailAlreadyExists extends CustomServerException {
  EmailAlreadyExists() : super('Esse email ja existe!');
}

class CPFAlreadyExists extends CustomServerException {
  CPFAlreadyExists() : super('Esse CPF ja foi cadastrado!');
}

class EmailNotFound extends CustomServerException {
  EmailNotFound() : super('Email não encontrado!');
}

class EmailAndPasswordNotMatch extends CustomServerException {
  EmailAndPasswordNotMatch() : super('Email e senha não conferem!');
}

class PasswordNotMatch extends CustomServerException {
  PasswordNotMatch() : super('Senha incorreta!');
}
