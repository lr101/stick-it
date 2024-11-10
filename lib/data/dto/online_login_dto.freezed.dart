// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnlineLoginDto _$OnlineLoginDtoFromJson(Map<String, dynamic> json) {
  return _OnlineLoginDto.fromJson(json);
}

/// @nodoc
mixin _$OnlineLoginDto {
  bool get loadedGroups => throw _privateConstructorUsedError;
  int? get numberOfGroups => throw _privateConstructorUsedError;
  bool get loadedPins => throw _privateConstructorUsedError;
  int? get numberOfLoadedPinGroups => throw _privateConstructorUsedError;
  bool get loadedMapPins => throw _privateConstructorUsedError;
  bool get loadedUser => throw _privateConstructorUsedError;

  /// Serializes this OnlineLoginDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineLoginDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineLoginDtoCopyWith<OnlineLoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineLoginDtoCopyWith<$Res> {
  factory $OnlineLoginDtoCopyWith(
          OnlineLoginDto value, $Res Function(OnlineLoginDto) then) =
      _$OnlineLoginDtoCopyWithImpl<$Res, OnlineLoginDto>;
  @useResult
  $Res call(
      {bool loadedGroups,
      int? numberOfGroups,
      bool loadedPins,
      int? numberOfLoadedPinGroups,
      bool loadedMapPins,
      bool loadedUser});
}

/// @nodoc
class _$OnlineLoginDtoCopyWithImpl<$Res, $Val extends OnlineLoginDto>
    implements $OnlineLoginDtoCopyWith<$Res> {
  _$OnlineLoginDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineLoginDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedGroups = null,
    Object? numberOfGroups = freezed,
    Object? loadedPins = null,
    Object? numberOfLoadedPinGroups = freezed,
    Object? loadedMapPins = null,
    Object? loadedUser = null,
  }) {
    return _then(_value.copyWith(
      loadedGroups: null == loadedGroups
          ? _value.loadedGroups
          : loadedGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfGroups: freezed == numberOfGroups
          ? _value.numberOfGroups
          : numberOfGroups // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedPins: null == loadedPins
          ? _value.loadedPins
          : loadedPins // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups
          ? _value.numberOfLoadedPinGroups
          : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedMapPins: null == loadedMapPins
          ? _value.loadedMapPins
          : loadedMapPins // ignore: cast_nullable_to_non_nullable
              as bool,
      loadedUser: null == loadedUser
          ? _value.loadedUser
          : loadedUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnlineLoginDtoImplCopyWith<$Res>
    implements $OnlineLoginDtoCopyWith<$Res> {
  factory _$$OnlineLoginDtoImplCopyWith(_$OnlineLoginDtoImpl value,
          $Res Function(_$OnlineLoginDtoImpl) then) =
      __$$OnlineLoginDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loadedGroups,
      int? numberOfGroups,
      bool loadedPins,
      int? numberOfLoadedPinGroups,
      bool loadedMapPins,
      bool loadedUser});
}

/// @nodoc
class __$$OnlineLoginDtoImplCopyWithImpl<$Res>
    extends _$OnlineLoginDtoCopyWithImpl<$Res, _$OnlineLoginDtoImpl>
    implements _$$OnlineLoginDtoImplCopyWith<$Res> {
  __$$OnlineLoginDtoImplCopyWithImpl(
      _$OnlineLoginDtoImpl _value, $Res Function(_$OnlineLoginDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnlineLoginDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedGroups = null,
    Object? numberOfGroups = freezed,
    Object? loadedPins = null,
    Object? numberOfLoadedPinGroups = freezed,
    Object? loadedMapPins = null,
    Object? loadedUser = null,
  }) {
    return _then(_$OnlineLoginDtoImpl(
      loadedGroups: null == loadedGroups
          ? _value.loadedGroups
          : loadedGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfGroups: freezed == numberOfGroups
          ? _value.numberOfGroups
          : numberOfGroups // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedPins: null == loadedPins
          ? _value.loadedPins
          : loadedPins // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups
          ? _value.numberOfLoadedPinGroups
          : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedMapPins: null == loadedMapPins
          ? _value.loadedMapPins
          : loadedMapPins // ignore: cast_nullable_to_non_nullable
              as bool,
      loadedUser: null == loadedUser
          ? _value.loadedUser
          : loadedUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineLoginDtoImpl implements _OnlineLoginDto {
  const _$OnlineLoginDtoImpl(
      {this.loadedGroups = false,
      this.numberOfGroups,
      this.loadedPins = false,
      this.numberOfLoadedPinGroups,
      this.loadedMapPins = false,
      this.loadedUser = false});

  factory _$OnlineLoginDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnlineLoginDtoImplFromJson(json);

  @override
  @JsonKey()
  final bool loadedGroups;
  @override
  final int? numberOfGroups;
  @override
  @JsonKey()
  final bool loadedPins;
  @override
  final int? numberOfLoadedPinGroups;
  @override
  @JsonKey()
  final bool loadedMapPins;
  @override
  @JsonKey()
  final bool loadedUser;

  @override
  String toString() {
    return 'OnlineLoginDto(loadedGroups: $loadedGroups, numberOfGroups: $numberOfGroups, loadedPins: $loadedPins, numberOfLoadedPinGroups: $numberOfLoadedPinGroups, loadedMapPins: $loadedMapPins, loadedUser: $loadedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineLoginDtoImpl &&
            (identical(other.loadedGroups, loadedGroups) ||
                other.loadedGroups == loadedGroups) &&
            (identical(other.numberOfGroups, numberOfGroups) ||
                other.numberOfGroups == numberOfGroups) &&
            (identical(other.loadedPins, loadedPins) ||
                other.loadedPins == loadedPins) &&
            (identical(
                    other.numberOfLoadedPinGroups, numberOfLoadedPinGroups) ||
                other.numberOfLoadedPinGroups == numberOfLoadedPinGroups) &&
            (identical(other.loadedMapPins, loadedMapPins) ||
                other.loadedMapPins == loadedMapPins) &&
            (identical(other.loadedUser, loadedUser) ||
                other.loadedUser == loadedUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, loadedGroups, numberOfGroups,
      loadedPins, numberOfLoadedPinGroups, loadedMapPins, loadedUser);

  /// Create a copy of OnlineLoginDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineLoginDtoImplCopyWith<_$OnlineLoginDtoImpl> get copyWith =>
      __$$OnlineLoginDtoImplCopyWithImpl<_$OnlineLoginDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineLoginDtoImplToJson(
      this,
    );
  }
}

abstract class _OnlineLoginDto implements OnlineLoginDto {
  const factory _OnlineLoginDto(
      {final bool loadedGroups,
      final int? numberOfGroups,
      final bool loadedPins,
      final int? numberOfLoadedPinGroups,
      final bool loadedMapPins,
      final bool loadedUser}) = _$OnlineLoginDtoImpl;

  factory _OnlineLoginDto.fromJson(Map<String, dynamic> json) =
      _$OnlineLoginDtoImpl.fromJson;

  @override
  bool get loadedGroups;
  @override
  int? get numberOfGroups;
  @override
  bool get loadedPins;
  @override
  int? get numberOfLoadedPinGroups;
  @override
  bool get loadedMapPins;
  @override
  bool get loadedUser;

  /// Create a copy of OnlineLoginDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineLoginDtoImplCopyWith<_$OnlineLoginDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
