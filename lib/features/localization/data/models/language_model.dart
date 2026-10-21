import 'package:json_annotation/json_annotation.dart';
part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel {
  final String languageCode;
  final String localeName;
  final String? countryCode;

  LanguageModel({
    required this.languageCode,
    required this.localeName,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

  factory LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);
}
