import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static Future<void> loadEnvs(String envPath) =>
      dotenv.load(fileName: envPath);

  static String? param(String paramName) => dotenv.env[paramName];
}
