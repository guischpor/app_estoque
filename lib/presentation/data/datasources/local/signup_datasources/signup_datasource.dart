import '../../../models/user_model.dart';

abstract class SignUpDataSource {
  Future<dynamic> createUser(UserModel user);
}
