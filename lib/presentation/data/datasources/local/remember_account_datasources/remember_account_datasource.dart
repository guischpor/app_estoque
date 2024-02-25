abstract class RememberAccountDataSource {
  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
    required bool isChecked,
  });

  Future<Map<dynamic, dynamic>> getRememberAccount();
}
