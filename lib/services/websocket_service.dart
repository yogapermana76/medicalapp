import 'package:flutter/foundation.dart';
import 'package:medicalapp/models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class WebSocketService {
  io.Socket? socket;
  final ValueNotifier<List<MessageModel>> messages = ValueNotifier([]);

  void connect() {
    socket = io.io(
        'http://localhost:3000',
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .build());

    socket?.onConnect((_) {
      print('Connected to WebSocket server');
    });

    socket?.onDisconnect((_) {
      print('Disconnected from WebSocket server');
    });

    socket?.on('message', (data) {
      debugPrint(data.toString());
      // final message = data.toString();
      // messages.value = [...messages.value, message];
    });
  }

  void sendMessage(int chatId, int senderId, String message) {
    socket?.emit('send_message', {
      'chat_id': chatId,
      'sender_id': senderId,
      'message': message,
    });
  }

  void disconnect() {
    socket?.disconnect();
  }
}
