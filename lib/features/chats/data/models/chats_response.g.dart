// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsResponse _$ChatsResponseFromJson(Map<String, dynamic> json) =>
    ChatsResponse(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatsResponseToJson(ChatsResponse instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: json['lastMessageTime'] as String?,
      avatar: json['avatar'] as String?,
      unreadMessages: (json['unreadMessages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
      'avatar': instance.avatar,
      'unreadMessages': instance.unreadMessages,
    };
