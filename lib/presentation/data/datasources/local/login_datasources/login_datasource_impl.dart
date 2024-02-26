import 'login_datasource.dart';
import 'package:hive/hive.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      late Box box;
      box = await Hive.openBox('users');

      List<UserModel> users = [];
      UserModel userModel = UserModel();

      final userMap = box.toMap();

      userMap.forEach((key, value) {
        users.add(UserModel.fromMap(value));
      });

      for (var user in users) {
        if (user.email == email && user.password == password) {
          return userModel = user;
        }

        if (user.email == email && user.password != password) {
          throw PasswordNotMatch();
        }
      }

      if (userModel.email == null) {
        throw EmailNotFound();
      }

      return userModel;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
