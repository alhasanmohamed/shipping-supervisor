import 'package:flutter/material.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/profile_image.dart';
import 'package:shipping_user_app/features/chats/data/models/chats_response.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;
  const ChatCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: ProfileImage(
        link: chat.avatar ?? '',
        radius: 25,
        iconColor: AppColors.gray,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.transparent,
        ),
      ),
      title: Text(
        chat.name ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        chat.lastMessage ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Builder(
        builder: (context) {
          if (chat.unreadMessages != null && chat.unreadMessages! > 0) {
            return Badge(
              backgroundColor: Theme.of(context).primaryColor,
              label: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  chat.unreadMessages.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            );
          } else {
            return Text(
              chat.lastMessageTime ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            );
          }
        },
      ),
    );
  }
}
