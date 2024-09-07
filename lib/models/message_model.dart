// ignore_for_file: non_constant_identifier_names

class MessageModel {
  final String message;
  final int sender_id;
  final int chat_id;
  final DateTime sent_at;

  MessageModel({
    required this.message,
    required this.sender_id,
    required this.chat_id,
    required this.sent_at,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        sender_id: json['sender_id'],
        chat_id: json['chat_id'],
        sent_at: DateTime.parse(json['sent_at']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'sender_id': sender_id,
        'chat_id': chat_id,
        'sent_at': sent_at.toString(),
      };
}
