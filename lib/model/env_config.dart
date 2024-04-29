import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Load the environment variables
  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      print('.env file not found');
    }
  }

//  Get the API key and API URL from the .env file
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}
