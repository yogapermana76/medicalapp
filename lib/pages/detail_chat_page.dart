import 'package:flutter/material.dart';
import 'package:medicalapp/models/message_model.dart';
import 'package:medicalapp/services/websocket_service.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({super.key});

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage>
    with WidgetsBindingObserver {
  final WebSocketService webSocketService = WebSocketService();
  final TextEditingController messageController = TextEditingController();
  int chatId = 3; // Example chat ID
  int userId = 32; // Example user ID

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    webSocketService
        .connect(); // Ensure connection is established if not already
    webSocketService.joinChat(chatId); // Join chat with the specified chatId
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      webSocketService.disconnect();
    }
  }

  @override
  void dispose() {
    // No need to call disconnect here unless you want to disconnect when leaving this page
    // webSocketService.disconnect(); // Commented out if using singleton
    WidgetsBinding.instance.removeObserver(this);
    webSocketService.disconnect();
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    final message = messageController.text;
    if (message.isNotEmpty) {
      webSocketService.sendMessage(chatId, userId, message);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child: Row(
            children: [
              Image.asset('assets/images/image_profile.png', width: 50),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Permana',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: sendMessage,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.send, color: primaryTextColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ValueListenableBuilder<List<MessageModel>>(
        valueListenable: webSocketService.messages,
        builder: (context, messages, _) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ChatBubble(
                isSender: message.sender_id == userId,
                text: message.message,
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: Column(
        children: [
          Expanded(
            child: content(),
          ),
          chatInput(),
        ],
      ),
    );
  }
}
