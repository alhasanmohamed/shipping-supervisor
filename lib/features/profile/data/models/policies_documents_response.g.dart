// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policies_documents_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliciesDocumentsResponse _$PoliciesDocumentsResponseFromJson(
        Map<String, dynamic> json) =>
    PoliciesDocumentsResponse(
      docs: (json['data'] as List<dynamic>)
          .map((e) => PoliciesDocuments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PoliciesDocumentsResponseToJson(
        PoliciesDocumentsResponse instance) =>
    <String, dynamic>{
      'data': instance.docs,
    };

PoliciesDocuments _$PoliciesDocumentsFromJson(Map<String, dynamic> json) =>
    PoliciesDocuments(
      id: (json['id'] as num).toInt(),
      title: json['title'] == null
          ? null
          : LocalizationModel.fromJson(json['title'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : LocalizationModel.fromJson(json['body'] as Map<String, dynamic>),
      type: json['slug'] as String?,
    );

Map<String, dynamic> _$PoliciesDocumentsToJson(PoliciesDocuments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'slug': instance.type,
    };
