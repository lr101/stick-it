// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineLoginDto {

 bool get loadedGroups; int? get numberOfGroups; bool get loadedPins; int? get numberOfLoadedPinGroups; bool get loadedUser; int? get numberOfSyncedPinGroups; bool get syncedPins;
/// Create a copy of OfflineLoginDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineLoginDtoCopyWith<OfflineLoginDto> get copyWith => _$OfflineLoginDtoCopyWithImpl<OfflineLoginDto>(this as OfflineLoginDto, _$identity);

  /// Serializes this OfflineLoginDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineLoginDto&&(identical(other.loadedGroups, loadedGroups) || other.loadedGroups == loadedGroups)&&(identical(other.numberOfGroups, numberOfGroups) || other.numberOfGroups == numberOfGroups)&&(identical(other.loadedPins, loadedPins) || other.loadedPins == loadedPins)&&(identical(other.numberOfLoadedPinGroups, numberOfLoadedPinGroups) || other.numberOfLoadedPinGroups == numberOfLoadedPinGroups)&&(identical(other.loadedUser, loadedUser) || other.loadedUser == loadedUser)&&(identical(other.numberOfSyncedPinGroups, numberOfSyncedPinGroups) || other.numberOfSyncedPinGroups == numberOfSyncedPinGroups)&&(identical(other.syncedPins, syncedPins) || other.syncedPins == syncedPins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedGroups,numberOfGroups,loadedPins,numberOfLoadedPinGroups,loadedUser,numberOfSyncedPinGroups,syncedPins);

@override
String toString() {
  return 'OfflineLoginDto(loadedGroups: $loadedGroups, numberOfGroups: $numberOfGroups, loadedPins: $loadedPins, numberOfLoadedPinGroups: $numberOfLoadedPinGroups, loadedUser: $loadedUser, numberOfSyncedPinGroups: $numberOfSyncedPinGroups, syncedPins: $syncedPins)';
}


}

/// @nodoc
abstract mixin class $OfflineLoginDtoCopyWith<$Res>  {
  factory $OfflineLoginDtoCopyWith(OfflineLoginDto value, $Res Function(OfflineLoginDto) _then) = _$OfflineLoginDtoCopyWithImpl;
@useResult
$Res call({
 bool loadedGroups, int? numberOfGroups, bool loadedPins, int? numberOfLoadedPinGroups, bool loadedUser, int? numberOfSyncedPinGroups, bool syncedPins
});




}
/// @nodoc
class _$OfflineLoginDtoCopyWithImpl<$Res>
    implements $OfflineLoginDtoCopyWith<$Res> {
  _$OfflineLoginDtoCopyWithImpl(this._self, this._then);

  final OfflineLoginDto _self;
  final $Res Function(OfflineLoginDto) _then;

/// Create a copy of OfflineLoginDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadedGroups = null,Object? numberOfGroups = freezed,Object? loadedPins = null,Object? numberOfLoadedPinGroups = freezed,Object? loadedUser = null,Object? numberOfSyncedPinGroups = freezed,Object? syncedPins = null,}) {
  return _then(_self.copyWith(
loadedGroups: null == loadedGroups ? _self.loadedGroups : loadedGroups // ignore: cast_nullable_to_non_nullable
as bool,numberOfGroups: freezed == numberOfGroups ? _self.numberOfGroups : numberOfGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedPins: null == loadedPins ? _self.loadedPins : loadedPins // ignore: cast_nullable_to_non_nullable
as bool,numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups ? _self.numberOfLoadedPinGroups : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedUser: null == loadedUser ? _self.loadedUser : loadedUser // ignore: cast_nullable_to_non_nullable
as bool,numberOfSyncedPinGroups: freezed == numberOfSyncedPinGroups ? _self.numberOfSyncedPinGroups : numberOfSyncedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,syncedPins: null == syncedPins ? _self.syncedPins : syncedPins // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OfflineLoginDto].
extension OfflineLoginDtoPatterns on OfflineLoginDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineLoginDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineLoginDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineLoginDto value)  $default,){
final _that = this;
switch (_that) {
case _OfflineLoginDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineLoginDto value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineLoginDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedUser,  int? numberOfSyncedPinGroups,  bool syncedPins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineLoginDto() when $default != null:
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedUser,_that.numberOfSyncedPinGroups,_that.syncedPins);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedUser,  int? numberOfSyncedPinGroups,  bool syncedPins)  $default,) {final _that = this;
switch (_that) {
case _OfflineLoginDto():
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedUser,_that.numberOfSyncedPinGroups,_that.syncedPins);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedUser,  int? numberOfSyncedPinGroups,  bool syncedPins)?  $default,) {final _that = this;
switch (_that) {
case _OfflineLoginDto() when $default != null:
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedUser,_that.numberOfSyncedPinGroups,_that.syncedPins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfflineLoginDto implements OfflineLoginDto {
  const _OfflineLoginDto({this.loadedGroups = false, this.numberOfGroups, this.loadedPins = false, this.numberOfLoadedPinGroups, this.loadedUser = false, this.numberOfSyncedPinGroups, this.syncedPins = false});
  factory _OfflineLoginDto.fromJson(Map<String, dynamic> json) => _$OfflineLoginDtoFromJson(json);

@override@JsonKey() final  bool loadedGroups;
@override final  int? numberOfGroups;
@override@JsonKey() final  bool loadedPins;
@override final  int? numberOfLoadedPinGroups;
@override@JsonKey() final  bool loadedUser;
@override final  int? numberOfSyncedPinGroups;
@override@JsonKey() final  bool syncedPins;

/// Create a copy of OfflineLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineLoginDtoCopyWith<_OfflineLoginDto> get copyWith => __$OfflineLoginDtoCopyWithImpl<_OfflineLoginDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfflineLoginDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineLoginDto&&(identical(other.loadedGroups, loadedGroups) || other.loadedGroups == loadedGroups)&&(identical(other.numberOfGroups, numberOfGroups) || other.numberOfGroups == numberOfGroups)&&(identical(other.loadedPins, loadedPins) || other.loadedPins == loadedPins)&&(identical(other.numberOfLoadedPinGroups, numberOfLoadedPinGroups) || other.numberOfLoadedPinGroups == numberOfLoadedPinGroups)&&(identical(other.loadedUser, loadedUser) || other.loadedUser == loadedUser)&&(identical(other.numberOfSyncedPinGroups, numberOfSyncedPinGroups) || other.numberOfSyncedPinGroups == numberOfSyncedPinGroups)&&(identical(other.syncedPins, syncedPins) || other.syncedPins == syncedPins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedGroups,numberOfGroups,loadedPins,numberOfLoadedPinGroups,loadedUser,numberOfSyncedPinGroups,syncedPins);

@override
String toString() {
  return 'OfflineLoginDto(loadedGroups: $loadedGroups, numberOfGroups: $numberOfGroups, loadedPins: $loadedPins, numberOfLoadedPinGroups: $numberOfLoadedPinGroups, loadedUser: $loadedUser, numberOfSyncedPinGroups: $numberOfSyncedPinGroups, syncedPins: $syncedPins)';
}


}

/// @nodoc
abstract mixin class _$OfflineLoginDtoCopyWith<$Res> implements $OfflineLoginDtoCopyWith<$Res> {
  factory _$OfflineLoginDtoCopyWith(_OfflineLoginDto value, $Res Function(_OfflineLoginDto) _then) = __$OfflineLoginDtoCopyWithImpl;
@override @useResult
$Res call({
 bool loadedGroups, int? numberOfGroups, bool loadedPins, int? numberOfLoadedPinGroups, bool loadedUser, int? numberOfSyncedPinGroups, bool syncedPins
});




}
/// @nodoc
class __$OfflineLoginDtoCopyWithImpl<$Res>
    implements _$OfflineLoginDtoCopyWith<$Res> {
  __$OfflineLoginDtoCopyWithImpl(this._self, this._then);

  final _OfflineLoginDto _self;
  final $Res Function(_OfflineLoginDto) _then;

/// Create a copy of OfflineLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadedGroups = null,Object? numberOfGroups = freezed,Object? loadedPins = null,Object? numberOfLoadedPinGroups = freezed,Object? loadedUser = null,Object? numberOfSyncedPinGroups = freezed,Object? syncedPins = null,}) {
  return _then(_OfflineLoginDto(
loadedGroups: null == loadedGroups ? _self.loadedGroups : loadedGroups // ignore: cast_nullable_to_non_nullable
as bool,numberOfGroups: freezed == numberOfGroups ? _self.numberOfGroups : numberOfGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedPins: null == loadedPins ? _self.loadedPins : loadedPins // ignore: cast_nullable_to_non_nullable
as bool,numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups ? _self.numberOfLoadedPinGroups : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedUser: null == loadedUser ? _self.loadedUser : loadedUser // ignore: cast_nullable_to_non_nullable
as bool,numberOfSyncedPinGroups: freezed == numberOfSyncedPinGroups ? _self.numberOfSyncedPinGroups : numberOfSyncedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,syncedPins: null == syncedPins ? _self.syncedPins : syncedPins // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
