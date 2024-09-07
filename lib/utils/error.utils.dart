import 'dart:convert';

String extractErrorMessage(String responseBody) {
  final responseMap = jsonDecode(responseBody);
  final message = responseMap['message'];

  if (message == null) {
    return 'Unknown error occurred';
  } else if (message is String) {
    return message;
  } else if (message is List) {
    return message[0];
  } else {
    return 'Unexpected error format';
  }
}
