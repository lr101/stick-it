import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_login_dto.freezed.dart';
part 'offline_login_dto.g.dart';

@freezed
class OfflineLoginDto with _$OfflineLoginDto {
  const factory OfflineLoginDto({
    @Default(false) bool loadedGroups,
    int? numberOfGroups,
    @Default(false) bool loadedPins,
    int? numberOfLoadedPinGroups,
    @Default(false) bool loadedUser,
  }) = _OfflineLoginDto;

  factory OfflineLoginDto.fromJson(Map<String, dynamic> json) => _$OfflineLoginDtoFromJson(json);
}
