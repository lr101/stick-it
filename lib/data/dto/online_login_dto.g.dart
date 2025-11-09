// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnlineLoginDto _$OnlineLoginDtoFromJson(Map<String, dynamic> json) =>
    _OnlineLoginDto(
      loadedGroups: json['loadedGroups'] as bool? ?? false,
      numberOfGroups: (json['numberOfGroups'] as num?)?.toInt(),
      loadedPins: json['loadedPins'] as bool? ?? false,
      numberOfLoadedPinGroups: (json['numberOfLoadedPinGroups'] as num?)
          ?.toInt(),
      loadedMapPins: json['loadedMapPins'] as bool? ?? false,
      loadedUser: json['loadedUser'] as bool? ?? false,
    );

Map<String, dynamic> _$OnlineLoginDtoToJson(_OnlineLoginDto instance) =>
    <String, dynamic>{
      'loadedGroups': instance.loadedGroups,
      'numberOfGroups': instance.numberOfGroups,
      'loadedPins': instance.loadedPins,
      'numberOfLoadedPinGroups': instance.numberOfLoadedPinGroups,
      'loadedMapPins': instance.loadedMapPins,
      'loadedUser': instance.loadedUser,
    };
