import 'package:hive/hive.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';
import 'package:app_estoque/presentation/domain/entities/user_entity.dart';

class UserServiceLocal {
  late Box box;

  Future<void> startHive() async {
    box = await Hive.openBox('userSaveLocal');
  }

  Future<void> saveLocalUser(UserEntity user) async {
    await startHive();

    final userLocal = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      cpf: user.cpf,
    );

    await box.put('userSaveLocal', userLocal.toMap());
  }

  Future<void> deleteLocalUser() async {
    await startHive();
    await box.delete('userSaveLocal');
  }

  Future<UserEntity?> getLocalUser() async {
    await startHive();

    final user = await box.get('userSaveLocal');
    if (user != null) {
      final userModel = UserModel.fromMap(user);

      return userModel;
    }
    return null;
  }

  Future<bool> hasLocalUser() async {
    await startHive();
    final user = await box.get('userSaveLocal');

    if (user != null) {
      return true;
    }
    return false;
  }
}
