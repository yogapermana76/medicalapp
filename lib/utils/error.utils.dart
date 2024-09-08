import 'dart:convert';

String extractErrorMessage(String responseBody) {
  try {
    final responseMap = jsonDecode(responseBody);
    final message = responseMap['message'];

    if (message == null) {
      return 'Unknown error occurred';
    } else if (message is String) {
      return message;
    } else if (message is List) {
      return message.isNotEmpty ? message[0] : 'Unknown error occurred';
    } else {
      return 'Unexpected error format';
    }
  } catch (e) {
    return 'Failed to parse error message';
  }
}
