import 'package:json_annotation/json_annotation.dart';
part 'chats_response.g.dart';

@JsonSerializable()
class ChatsResponse {
  final List<ChatModel> chats;

  ChatsResponse({
    required this.chats,
  });

  Map<String, dynamic> toJson() => _$ChatsResponseToJson(this);

  factory ChatsResponse.fromJson(Map<String, dynamic> json) => _$ChatsResponseFromJson(json);
}

@JsonSerializable()
class ChatModel {
  final String? id;
  final String? name;
  final String? lastMessage;
  final String? lastMessageTime;
  final String? avatar;
  final int? unreadMessages;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.avatar,
    required this.unreadMessages,
  });

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}
