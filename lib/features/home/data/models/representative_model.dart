import 'package:json_annotation/json_annotation.dart';
part 'representative_model.g.dart';

@JsonSerializable()
class RepresentativeModel {
  final int id;
  final String name;
  final String? avatar;
  @JsonKey(name: 'updated_at')
  final String? lastSeen;
  final double lat;
  final double lon;
  @JsonKey(name: 'is_active')
  final bool isActive;

  RepresentativeModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastSeen,
    required this.lat,
    required this.lon,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => _$RepresentativeModelToJson(this);

  factory RepresentativeModel.fromJson(Map<String, dynamic> json) =>
      _$RepresentativeModelFromJson(json);
}
