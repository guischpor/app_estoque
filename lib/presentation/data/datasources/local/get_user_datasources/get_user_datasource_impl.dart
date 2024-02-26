import 'package:hive/hive.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';
import 'package:app_estoque/presentation/data/datasources/local/get_user_datasources/get_user_datasource.dart';

class GetUserDataSourceImpl implements GetUserDataSource {
  @override
  Future<UserModel> getUser({
    required String id,
    required String email,
    required String cpf,
  }) async {
    try {
      late Box box;
      box = await Hive.openBox('users');

      final user = await box.get(id);

      if (user == null) {
        throw UserNotFound();
      }

      return UserModel.fromMap(user);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      print(error);

      throw ServerBadRequest();
    }
  }
}
