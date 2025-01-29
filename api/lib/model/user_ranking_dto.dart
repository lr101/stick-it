//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserRankingDto {
  /// Returns a new [UserRankingDto] instance.
  UserRankingDto({
    this.items = const [],
    this.currentUser,
  });

  List<UserRankingDtoInner> items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserRankingDtoInner? currentUser;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserRankingDto &&
    _deepEquality.equals(other.items, items) &&
    other.currentUser == currentUser;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (items.hashCode) +
    (currentUser == null ? 0 : currentUser!.hashCode);

  @override
  String toString() => 'UserRankingDto[items=$items, currentUser=$currentUser]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'items'] = this.items;
    if (this.currentUser != null) {
      json[r'currentUser'] = this.currentUser;
    } else {
      json[r'currentUser'] = null;
    }
    return json;
  }

  /// Returns a new [UserRankingDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserRankingDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserRankingDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserRankingDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserRankingDto(
        items: UserRankingDtoInner.listFromJson(json[r'items']),
        currentUser: UserRankingDtoInner.fromJson(json[r'currentUser']),
      );
    }
    return null;
  }

  static List<UserRankingDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserRankingDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserRankingDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserRankingDto> mapFromJson(dynamic json) {
    final map = <String, UserRankingDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserRankingDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserRankingDto-objects as value to a dart map
  static Map<String, List<UserRankingDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserRankingDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserRankingDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

