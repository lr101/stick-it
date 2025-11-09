// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnlineLoginDto {

 bool get loadedGroups; int? get numberOfGroups; bool get loadedPins; int? get numberOfLoadedPinGroups; bool get loadedMapPins; bool get loadedUser;
/// Create a copy of OnlineLoginDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnlineLoginDtoCopyWith<OnlineLoginDto> get copyWith => _$OnlineLoginDtoCopyWithImpl<OnlineLoginDto>(this as OnlineLoginDto, _$identity);

  /// Serializes this OnlineLoginDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnlineLoginDto&&(identical(other.loadedGroups, loadedGroups) || other.loadedGroups == loadedGroups)&&(identical(other.numberOfGroups, numberOfGroups) || other.numberOfGroups == numberOfGroups)&&(identical(other.loadedPins, loadedPins) || other.loadedPins == loadedPins)&&(identical(other.numberOfLoadedPinGroups, numberOfLoadedPinGroups) || other.numberOfLoadedPinGroups == numberOfLoadedPinGroups)&&(identical(other.loadedMapPins, loadedMapPins) || other.loadedMapPins == loadedMapPins)&&(identical(other.loadedUser, loadedUser) || other.loadedUser == loadedUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedGroups,numberOfGroups,loadedPins,numberOfLoadedPinGroups,loadedMapPins,loadedUser);

@override
String toString() {
  return 'OnlineLoginDto(loadedGroups: $loadedGroups, numberOfGroups: $numberOfGroups, loadedPins: $loadedPins, numberOfLoadedPinGroups: $numberOfLoadedPinGroups, loadedMapPins: $loadedMapPins, loadedUser: $loadedUser)';
}


}

/// @nodoc
abstract mixin class $OnlineLoginDtoCopyWith<$Res>  {
  factory $OnlineLoginDtoCopyWith(OnlineLoginDto value, $Res Function(OnlineLoginDto) _then) = _$OnlineLoginDtoCopyWithImpl;
@useResult
$Res call({
 bool loadedGroups, int? numberOfGroups, bool loadedPins, int? numberOfLoadedPinGroups, bool loadedMapPins, bool loadedUser
});




}
/// @nodoc
class _$OnlineLoginDtoCopyWithImpl<$Res>
    implements $OnlineLoginDtoCopyWith<$Res> {
  _$OnlineLoginDtoCopyWithImpl(this._self, this._then);

  final OnlineLoginDto _self;
  final $Res Function(OnlineLoginDto) _then;

/// Create a copy of OnlineLoginDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadedGroups = null,Object? numberOfGroups = freezed,Object? loadedPins = null,Object? numberOfLoadedPinGroups = freezed,Object? loadedMapPins = null,Object? loadedUser = null,}) {
  return _then(_self.copyWith(
loadedGroups: null == loadedGroups ? _self.loadedGroups : loadedGroups // ignore: cast_nullable_to_non_nullable
as bool,numberOfGroups: freezed == numberOfGroups ? _self.numberOfGroups : numberOfGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedPins: null == loadedPins ? _self.loadedPins : loadedPins // ignore: cast_nullable_to_non_nullable
as bool,numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups ? _self.numberOfLoadedPinGroups : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedMapPins: null == loadedMapPins ? _self.loadedMapPins : loadedMapPins // ignore: cast_nullable_to_non_nullable
as bool,loadedUser: null == loadedUser ? _self.loadedUser : loadedUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnlineLoginDto].
extension OnlineLoginDtoPatterns on OnlineLoginDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnlineLoginDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnlineLoginDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnlineLoginDto value)  $default,){
final _that = this;
switch (_that) {
case _OnlineLoginDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnlineLoginDto value)?  $default,){
final _that = this;
switch (_that) {
case _OnlineLoginDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedMapPins,  bool loadedUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnlineLoginDto() when $default != null:
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedMapPins,_that.loadedUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedMapPins,  bool loadedUser)  $default,) {final _that = this;
switch (_that) {
case _OnlineLoginDto():
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedMapPins,_that.loadedUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loadedGroups,  int? numberOfGroups,  bool loadedPins,  int? numberOfLoadedPinGroups,  bool loadedMapPins,  bool loadedUser)?  $default,) {final _that = this;
switch (_that) {
case _OnlineLoginDto() when $default != null:
return $default(_that.loadedGroups,_that.numberOfGroups,_that.loadedPins,_that.numberOfLoadedPinGroups,_that.loadedMapPins,_that.loadedUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnlineLoginDto implements OnlineLoginDto {
  const _OnlineLoginDto({this.loadedGroups = false, this.numberOfGroups, this.loadedPins = false, this.numberOfLoadedPinGroups, this.loadedMapPins = false, this.loadedUser = false});
  factory _OnlineLoginDto.fromJson(Map<String, dynamic> json) => _$OnlineLoginDtoFromJson(json);

@override@JsonKey() final  bool loadedGroups;
@override final  int? numberOfGroups;
@override@JsonKey() final  bool loadedPins;
@override final  int? numberOfLoadedPinGroups;
@override@JsonKey() final  bool loadedMapPins;
@override@JsonKey() final  bool loadedUser;

/// Create a copy of OnlineLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineLoginDtoCopyWith<_OnlineLoginDto> get copyWith => __$OnlineLoginDtoCopyWithImpl<_OnlineLoginDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnlineLoginDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineLoginDto&&(identical(other.loadedGroups, loadedGroups) || other.loadedGroups == loadedGroups)&&(identical(other.numberOfGroups, numberOfGroups) || other.numberOfGroups == numberOfGroups)&&(identical(other.loadedPins, loadedPins) || other.loadedPins == loadedPins)&&(identical(other.numberOfLoadedPinGroups, numberOfLoadedPinGroups) || other.numberOfLoadedPinGroups == numberOfLoadedPinGroups)&&(identical(other.loadedMapPins, loadedMapPins) || other.loadedMapPins == loadedMapPins)&&(identical(other.loadedUser, loadedUser) || other.loadedUser == loadedUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedGroups,numberOfGroups,loadedPins,numberOfLoadedPinGroups,loadedMapPins,loadedUser);

@override
String toString() {
  return 'OnlineLoginDto(loadedGroups: $loadedGroups, numberOfGroups: $numberOfGroups, loadedPins: $loadedPins, numberOfLoadedPinGroups: $numberOfLoadedPinGroups, loadedMapPins: $loadedMapPins, loadedUser: $loadedUser)';
}


}

/// @nodoc
abstract mixin class _$OnlineLoginDtoCopyWith<$Res> implements $OnlineLoginDtoCopyWith<$Res> {
  factory _$OnlineLoginDtoCopyWith(_OnlineLoginDto value, $Res Function(_OnlineLoginDto) _then) = __$OnlineLoginDtoCopyWithImpl;
@override @useResult
$Res call({
 bool loadedGroups, int? numberOfGroups, bool loadedPins, int? numberOfLoadedPinGroups, bool loadedMapPins, bool loadedUser
});




}
/// @nodoc
class __$OnlineLoginDtoCopyWithImpl<$Res>
    implements _$OnlineLoginDtoCopyWith<$Res> {
  __$OnlineLoginDtoCopyWithImpl(this._self, this._then);

  final _OnlineLoginDto _self;
  final $Res Function(_OnlineLoginDto) _then;

/// Create a copy of OnlineLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadedGroups = null,Object? numberOfGroups = freezed,Object? loadedPins = null,Object? numberOfLoadedPinGroups = freezed,Object? loadedMapPins = null,Object? loadedUser = null,}) {
  return _then(_OnlineLoginDto(
loadedGroups: null == loadedGroups ? _self.loadedGroups : loadedGroups // ignore: cast_nullable_to_non_nullable
as bool,numberOfGroups: freezed == numberOfGroups ? _self.numberOfGroups : numberOfGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedPins: null == loadedPins ? _self.loadedPins : loadedPins // ignore: cast_nullable_to_non_nullable
as bool,numberOfLoadedPinGroups: freezed == numberOfLoadedPinGroups ? _self.numberOfLoadedPinGroups : numberOfLoadedPinGroups // ignore: cast_nullable_to_non_nullable
as int?,loadedMapPins: null == loadedMapPins ? _self.loadedMapPins : loadedMapPins // ignore: cast_nullable_to_non_nullable
as bool,loadedUser: null == loadedUser ? _self.loadedUser : loadedUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
