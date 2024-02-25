import 'package:hive/hive.dart';
import 'remember_account_datasource.dart';
import '../../../../../core/errors/server_exception.dart';

class RememberAccountDataSourceImpl implements RememberAccountDataSource {
  @override
  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
    required bool isChecked,
  }) async {
    try {
      late Box box;
      box = await Hive.openBox('rememberAccount');

      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'isChecked': isChecked
      };

      await box.put(
        'rememberAccount',
        data,
      );

      return data;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      print(error);

      throw ServerBadRequest();
    }
  }

  @override
  Future<Map<dynamic, dynamic>> getRememberAccount() async {
    try {
      late Box box;
      box = await Hive.openBox('rememberAccount');

      Map<dynamic, dynamic> data = {};

      final dataRemember = await box.get('rememberAccount');

      if (dataRemember != null) {
        data = dataRemember;
      }

      return data;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      print(error);

      throw ServerBadRequest();
    }
  }
}
