import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_login_dto.freezed.dart';
part 'online_login_dto.g.dart';

@freezed
abstract class OnlineLoginDto with _$OnlineLoginDto {
  const factory OnlineLoginDto({
    @Default(false) bool loadedGroups,
    int? numberOfGroups,
    @Default(false) bool loadedPins,
    int? numberOfLoadedPinGroups,
    @Default(false) bool loadedMapPins,
    @Default(false) bool loadedUser,
  }) = _OnlineLoginDto;

  factory OnlineLoginDto.fromJson(Map<String, dynamic> json) => _$OnlineLoginDtoFromJson(json);
}
