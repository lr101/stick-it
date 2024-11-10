// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineLoginDtoImpl _$$OnlineLoginDtoImplFromJson(Map<String, dynamic> json) =>
    _$OnlineLoginDtoImpl(
      loadedGroups: json['loadedGroups'] as bool? ?? false,
      numberOfGroups: (json['numberOfGroups'] as num?)?.toInt(),
      loadedPins: json['loadedPins'] as bool? ?? false,
      numberOfLoadedPinGroups:
          (json['numberOfLoadedPinGroups'] as num?)?.toInt(),
      loadedMapPins: json['loadedMapPins'] as bool? ?? false,
      loadedUser: json['loadedUser'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnlineLoginDtoImplToJson(
        _$OnlineLoginDtoImpl instance) =>
    <String, dynamic>{
      'loadedGroups': instance.loadedGroups,
      'numberOfGroups': instance.numberOfGroups,
      'loadedPins': instance.loadedPins,
      'numberOfLoadedPinGroups': instance.numberOfLoadedPinGroups,
      'loadedMapPins': instance.loadedMapPins,
      'loadedUser': instance.loadedUser,
    };
