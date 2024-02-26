import 'package:hive/hive.dart';
import 'check_logged_datasource.dart';
import '../../../../../core/errors/server_exception.dart';

class CheckLoggedDataSourceImpl implements CheckLoggedDataSource {
  @override
  Future<bool> getLogging() async {
    try {
      late Box box;
      box = await Hive.openBox('logged');

      bool isLoggedIn = await box.get('logged');

      return isLoggedIn;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }

  @override
  Future<bool> setLogging(bool value) async {
    try {
      late Box box;
      box = await Hive.openBox('logged');

      final isLoggedIn = value;

      await box.put(
        'logged',
        isLoggedIn,
      );

      return isLoggedIn;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
