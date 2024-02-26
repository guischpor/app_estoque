import 'package:app_estoque/presentation/data/models/user_model.dart';

abstract class GetUserDataSource {
  Future<UserModel> getUser({
    required String id,
    required String email,
    required String cpf,
  });
}
