// ignore_for_file: non_constant_identifier_names

class ChatModel {
  final int id;
  final int user_id;
  final int doctor_id;
  final DateTime created_at;

  ChatModel({
    required this.id,
    required this.user_id,
    required this.doctor_id,
    required this.created_at,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json['id'],
        user_id: json['user_id'],
        doctor_id: json['doctor_id'],
        created_at: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'doctor_id': doctor_id,
        'created_at': created_at.toString(),
      };
}
