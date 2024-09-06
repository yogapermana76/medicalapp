class MessageModel {
  final String message;
  final int senderId;
  final String chatId;
  final DateTime sentAt;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.chatId,
    required this.sentAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        senderId: json['senderId'],
        chatId: json['chatId'],
        sentAt: DateTime.parse(json['sentAt']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'senderId': senderId,
        'chatId': chatId,
        'sentAt': sentAt.toString(),
      };
}
