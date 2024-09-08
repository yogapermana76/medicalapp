// ignore_for_file: non_constant_identifier_names

import 'package:medicalapp/models/message_model.dart';

class ChatUserModel {
  final String name;

  ChatUserModel({required this.name});

  factory ChatUserModel.fromJson(Map<String, dynamic> json) => ChatUserModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class ChatDoctorModel {
  final ChatUserModel user;

  ChatDoctorModel({required this.user});

  factory ChatDoctorModel.fromJson(Map<String, dynamic> json) =>
      ChatDoctorModel(
        user: ChatUserModel.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
      };
}

class ChatModel {
  final int id;
  final int user_id;
  final int doctor_id;
  final DateTime created_at;
  List<MessageModel>? messages = [];
  ChatUserModel? user; // Tambahkan properti user
  ChatDoctorModel? doctor; // Tambahkan properti doctor

  ChatModel({
    required this.id,
    required this.user_id,
    required this.doctor_id,
    required this.created_at,
    this.messages,
    this.user,
    this.doctor,
  });

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
        user: json['user'] != null
            ? ChatUserModel.fromJson(json['user'])
            : null, // Ambil data user
        doctor: json['doctor'] != null
            ? ChatDoctorModel.fromJson(json['doctor'])
            : null, // Ambil data doctor
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'doctor_id': doctor_id,
        'created_at': created_at.toString(),
        'messages': messages?.map((item) => item.toJson()).toList(),
        'user': user?.toJson(), // Serialisasi data user
        'doctor': doctor?.toJson(), // Serialisasi data doctor
      };
}
