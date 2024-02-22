import 'core/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/core/styles/theme_data.dart';
import 'package:app_estoque/presentation/presenter/pages/login/view/login_page.dart';

void main() {
  InjectionDependencies();
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeDataStyle themeStyle = ThemeDataStyle();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Estoque',
      theme: themeStyle.theme,
      routerConfig: RouterApp().router,
    );
  }
}
