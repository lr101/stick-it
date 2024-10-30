// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfflineLoginDtoImpl _$$OfflineLoginDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OfflineLoginDtoImpl(
      loadedGroups: json['loadedGroups'] as bool? ?? false,
      numberOfGroups: (json['numberOfGroups'] as num?)?.toInt(),
      loadedPins: json['loadedPins'] as bool? ?? false,
      numberOfLoadedPinGroups:
          (json['numberOfLoadedPinGroups'] as num?)?.toInt(),
      loadedUser: json['loadedUser'] as bool? ?? false,
    );

Map<String, dynamic> _$$OfflineLoginDtoImplToJson(
        _$OfflineLoginDtoImpl instance) =>
    <String, dynamic>{
      'loadedGroups': instance.loadedGroups,
      'numberOfGroups': instance.numberOfGroups,
      'loadedPins': instance.loadedPins,
      'numberOfLoadedPinGroups': instance.numberOfLoadedPinGroups,
      'loadedUser': instance.loadedUser,
    };
