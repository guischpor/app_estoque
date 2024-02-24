import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'signup_datasource.dart';
import '../../../models/user_model.dart';
import '../../../../../core/utils/encrypt_password.dart';
import 'package:app_estoque/core/errors/server_exception.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  @override
  Future<dynamic> createUser(UserModel user) async {
    late Box box;
    box = await Hive.openBox('users');

    try {
      final newUser = UserModel(
        id: const Uuid().v1(),
        name: user.name,
        email: user.email,
        password: EncryptPassword.encrypt(user.password!),
        cpf: user.cpf,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      );

      await box.put(
        newUser.id,
        newUser.toMap(),
      );

      return box.get(newUser.id);
    } on HiveError catch (error) {
      if (error.message.contains("Box not found")) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
