import 'package:flutter/material.dart';
import 'package:medicalapp/models/chat_model.dart';
import 'package:medicalapp/pages/main_page.dart';
import 'package:medicalapp/providers/auth_provider.dart';
import 'package:medicalapp/services/chat_service.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/utils/error.utils.dart';
import 'package:medicalapp/widgets/chat_tile.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatModel> chats = [];

  @override
  void initState() {
    super.initState();
    getChats();
  }

  void getChats() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final user = authProvider.user;

      final chats = await ChatService().getChats(userId: user.id);

      setState(() {
        this.chats.clear();
        this.chats.addAll(chats);
      });
    } catch (e) {
      throw extractErrorMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat, size: 80, color: primaryColor),
              const SizedBox(height: 20),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You have never done a transaction',
                style: subtitleTextStyle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MainPage(
                        initialIndex: 2,
                      ),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Medicines',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: this.chats.map((chat) => ChatTile()).toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
