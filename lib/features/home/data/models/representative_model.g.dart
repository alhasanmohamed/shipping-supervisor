// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representative_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepresentativeModel _$RepresentativeModelFromJson(Map<String, dynamic> json) =>
    RepresentativeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      lastSeen: json['updated_at'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$RepresentativeModelToJson(
        RepresentativeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'updated_at': instance.lastSeen,
      'lat': instance.lat,
      'lon': instance.lon,
      'is_active': instance.isActive,
    };
