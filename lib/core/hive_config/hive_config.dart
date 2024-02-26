import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static Future<void> start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
