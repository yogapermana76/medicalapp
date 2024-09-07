import 'dart:convert';

import 'package:medicalapp/models/chat_model.dart';
import 'package:medicalapp/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:medicalapp/utils/error.utils.dart';
import 'package:medicalapp/utils/local_torage.utils.dart';

class ChatService {
  final String baseUrl = 'http://127.0.0.1:3000/api';

  Future<ChatModel> createChat({
    required int userId,
    required int doctorId,
  }) async {
    final url = '$baseUrl/chats';

    final String? token = await getString('token');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String,
    };
    final body = jsonEncode({'user_id': userId, 'doctor_id': doctorId});

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      final chat = ChatModel.fromJson(data);
      return chat;
    } else {
      throw extractErrorMessage(response.body);
    }
  }

  Future<List<ChatModel>> getChats({
    required int userId,
  }) async {
    final url = '$baseUrl/chats/$userId';

    final String? token = await getString('token');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String,
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      return data
          .map((item) => ChatModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw extractErrorMessage(response.body);
    }
  }

  Future<List<MessageModel>> getMessages({
    required int chatId,
  }) async {
    final url = '$baseUrl/messages/$chatId';

    final String? token = await getString('token');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String,
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      return data
          .map((item) => MessageModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw extractErrorMessage(response.body);
    }
  }
}
