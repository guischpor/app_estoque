import 'package:app_estoque/presentation/data/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}
