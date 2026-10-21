import 'package:json_annotation/json_annotation.dart';
import 'package:shipping_user_app/features/localization/data/models/localization_model.dart';
part 'policies_documents_response.g.dart';

@JsonSerializable()
class PoliciesDocumentsResponse {
  @JsonKey(name: 'data')
  final List<PoliciesDocuments> docs;

  PoliciesDocumentsResponse({
    required this.docs,
  });

  factory PoliciesDocumentsResponse.fromJson(Map<String, dynamic> json) =>
      _$PoliciesDocumentsResponseFromJson(json);
}

@JsonSerializable()
class PoliciesDocuments {
  final int id;
  final LocalizationModel? title;
  final LocalizationModel? body;
  @JsonKey(name: 'slug')
  final String? type;

  PoliciesDocuments({
    required this.id,
    this.title,
    this.body,
    this.type,
  });

  factory PoliciesDocuments.fromJson(Map<String, dynamic> json) =>
      _$PoliciesDocumentsFromJson(json);
}
