import 'package:flutter/foundation.dart';
import 'package:medicalapp/config/app_config.dart';
import 'package:medicalapp/models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class WebSocketService {
  // Private constructor
  WebSocketService._internal();

  // Single instance of WebSocketService
  static final WebSocketService _instance = WebSocketService._internal();

  // Factory constructor returns the single instance
  factory WebSocketService() {
    return _instance;
  }

  io.Socket? socket;
  final ValueNotifier<List<MessageModel>> messages = ValueNotifier([]);

  void connect() {
    if (socket != null && socket!.connected) {
      return; // Prevent reconnecting if already connected
    }

    final String baseUrl = AppConfig.apiUrl;

    socket = io.io(
      baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket']) // Use websocket transport
          .enableReconnection() // Enable automatic reconnections
          .setReconnectionDelay(5000) // Delay between reconnections
          .build(),
    );

    socket?.onConnect((_) {
      print('Connected to WebSocket server');
    });

    socket?.onReconnect((_) {
      print('Reconnected to WebSocket server');
    });

    socket?.onReconnectError((error) {
      print('Reconnection error: $error');
    });

    socket?.onDisconnect((_) {
      print('Disconnected from WebSocket server');
    });

    socket?.onError((error) {
      print('Socket error: $error');
    });

    socket?.on('message', (data) {
      final message = MessageModel.fromJson(data); // Parse incoming message
      messages.value = [...messages.value, message]; // Append new message
    });
  }

  void joinChat(int chatId) {
    socket!.emit('join_chat', {'chatId': chatId});
  }

  void sendMessage(int chatId, int senderId, String message) {
    socket!.emit('send_message', {
      'chat_id': chatId,
      'sender_id': senderId,
      'message': message,
    });
  }

  void disconnect() {
    socket?.off('message'); // Remove message listener
    socket?.disconnect();
    socket = null;
  }
}
