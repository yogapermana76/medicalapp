import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String apiUrl = dotenv.env['API_URL'] ?? 'http://127.0.0.1:3000';

  // if you have an API key that you want to use in your app
  // static final String apiKey = dotenv.env['API_KEY'] ?? 'your_default_api_key';
}
