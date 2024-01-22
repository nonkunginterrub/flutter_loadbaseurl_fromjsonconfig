import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AppConfig {
  late String apiUrl;
  late String appName;
  late String version;

  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();

  Future<void> loadConfig() async {
    String configString = await rootBundle.loadString('assets/config.json');
    Map<String, dynamic> config = jsonDecode(configString);

    apiUrl = config['apiUrl'];
    appName = config['appName'];
    version = config['version'];
  }
}
