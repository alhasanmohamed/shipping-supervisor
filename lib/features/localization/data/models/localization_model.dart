import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/widgets.dart';
part 'localization_model.g.dart';

@JsonSerializable()
class LocalizationModel {
  final String? en;
  final String? ar;

  LocalizationModel({
    this.en,
    this.ar,
  });

  Map<String, dynamic> toJson() => _$LocalizationModelToJson(this);

  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);

  String? getLocalizedValue(context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return en;
      case 'ar':
        return ar;
      default:
        return en;
    }
  }
}