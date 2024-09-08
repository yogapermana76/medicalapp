import 'package:flutter/material.dart';
import 'package:medicalapp/models/chat_model.dart';
import 'package:medicalapp/pages/detail_chat_page.dart';
import 'package:medicalapp/providers/auth_provider.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/utils/format_date.utils.dart';
import 'package:provider/provider.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;

  const ChatTile(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    // Check if chat.messages is not empty
    if (chat.messages!.isEmpty) {
      return Container(); // Or handle the empty state as needed
    }

    final String name =
        user!.role == 'doctor' ? chat.user!.name : chat.doctor!.user.name;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailChatPage(chatId: chat.id, userId: user.id, name: name),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/image_profile.png', width: 54),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        chat.messages!.first.message,
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Text(
                  formatDate(chat.messages!.first.sent_at),
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}
