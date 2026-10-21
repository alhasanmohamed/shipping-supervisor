import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  final String? name;
  final String? id;
  final String? avatar;
  final int? coinBalance;
  final double? balance;

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);

  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);

  InfoModel({
    required this.name,
    required this.id,
    required this.avatar,
    required this.coinBalance,
    required this.balance,
  });
}
