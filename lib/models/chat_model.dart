// ignore_for_file: non_constant_identifier_names

import 'package:medicalapp/models/message_model.dart';

class ChatModel {
  final int id;
  final int user_id;
  final int doctor_id;
  final DateTime created_at;
  List<MessageModel>? messages = [];

  ChatModel(
      {required this.id,
      required this.user_id,
      required this.doctor_id,
      required this.created_at,
      this.messages});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json['id'],
        user_id: json['user_id'],
        doctor_id: json['doctor_id'],
        created_at: DateTime.parse(json['created_at']),
        messages: json['messages'] != null
            ? (json['messages'] as List<dynamic>)
                .map((item) => MessageModel.fromJson(item))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'doctor_id': doctor_id,
        'created_at': created_at.toString(),
        'messages': messages?.map((item) => item.toJson()).toList(),
      };
}
