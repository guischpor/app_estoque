import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_estoque/core/styles/theme_data.dart';
import 'package:app_estoque/presentation/presenter/pages/login/view/login_page.dart';

void main() {
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

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Estoque',
      theme: themeStyle.theme,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
