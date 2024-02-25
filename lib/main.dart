import 'core/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/hive_config/hive_config.dart';
import 'core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/core/styles/theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.start();

  injectionDependencies();
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      routerConfig: routeProvider,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
