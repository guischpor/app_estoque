import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/styles/app_color.dart';
import '../../../core/routes/named_routes.dart';
import '../controllers/app_controller/app_controller.dart';
import '../../../core/dependencies/injection_dependencies.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final appController = getIt<AppController>();
  @override
  void initState() {
    super.initState();
  }

  void logout() async {
    await appController.setLoggedIn(false);
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
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
        ),
        children: [
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    );
  }
}
