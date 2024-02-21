import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoApp {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';

  Future<String> getInfoApp(String typeInfo) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    switch (typeInfo) {
      case 'version':
        return version = packageInfo.version;
      case 'buildNumber':
        return buildNumber = packageInfo.buildNumber;
      case 'appName':
        return appName = packageInfo.appName;
      case 'packageName':
        return packageName = packageInfo.packageName;
      default:
        return 'Tipo incorreto';
    }
  }
}
