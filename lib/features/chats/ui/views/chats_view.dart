import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/features/chats/data/models/chats_response.dart';
import 'package:shipping_user_app/features/chats/ui/widgets/chat_card.dart';
import 'package:shipping_user_app/features/profile/logic/profile_cubit.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsResponse chatsResponse = ChatsResponse(
      chats: [
        ChatModel(
          id: '1',
          name: 'John Doe',
          lastMessage: 'Hello, how are you?',
          lastMessageTime: '2025-01-01',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 1,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 22,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 100,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
        ChatModel(
          id: '2',
          name: 'Jane Doe',
          lastMessage: 'I am fine, thank you!',
          lastMessageTime: '2025-01-02',
          avatar: context.read<ProfileCubit>().info.avatar ?? '',
          unreadMessages: 0,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).messages,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
      body: SafeArea(
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                sliver: SliverToBoxAdapter(
                  child: CustomSearchBar(),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                fillOverscroll: true,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: chatsResponse.chats.length,
                  itemBuilder: (context, index) => ChatCard(
                    chat: chatsResponse.chats[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
