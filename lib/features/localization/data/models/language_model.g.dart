// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      languageCode: json['languageCode'] as String,
      localeName: json['localeName'] as String,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'localeName': instance.localeName,
      'countryCode': instance.countryCode,
    };
