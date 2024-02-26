import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/styles/app_color.dart';
import '../../../core/routes/named_routes.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../core/services/user_service_local.dart';
import '../controllers/app_controller/app_controller.dart';
import '../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/domain/entities/user_entity.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final appController = getIt<AppController>();
  final userServiceLocal = getIt<UserServiceLocal>();

  UserEntity user = UserEntity();
  @override
  void initState() {
    super.initState();
    getLocalUser();
  }

  void getLocalUser() async {
    final userLocal = await userServiceLocal.getLocalUser();

    user = UserEntity(
      id: userLocal!.id,
      name: userLocal.name,
      email: userLocal.email,
      cpf: userLocal.cpf,
    );

    setState(() {});
  }

  void logout() async {
    await appController.setLoggedIn(false);

    final userHasLocal = await userServiceLocal.hasLocalUser();

    if (userHasLocal) {
      await userServiceLocal.deleteLocalUser();
    }

    if (appController.isCheckLogged == false) {
      context.go(NamedRoutes.login);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfile(),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).longestSide * 0.02),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: AppColors.blue,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person,
            color: AppColors.white,
            size: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? '',
                  style: AppTextStyle.nunitoWhite18.font15.bold,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user.email ?? '',
                  style: AppTextStyle.nunitoWhite18.font15.bold,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user.cpf ?? '',
                  style: AppTextStyle.nunitoWhite18.font15.bold,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
