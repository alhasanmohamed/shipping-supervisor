// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      coinBalance: (json['coinBalance'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'avatar': instance.avatar,
      'coinBalance': instance.coinBalance,
      'balance': instance.balance,
    };
