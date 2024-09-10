//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PinWithoutImageDto {
  /// Returns a new [PinWithoutImageDto] instance.
  PinWithoutImageDto({
    required this.id,
    required this.creationDate,
    required this.latitude,
    required this.longitude,
    required this.creationUser,
    required this.groupId,
  });

  String id;

  DateTime creationDate;

  /// Minimum value: -90
  /// Maximum value: 90
  num latitude;

  /// Minimum value: -180
  /// Maximum value: 180
  num longitude;

  String creationUser;

  String groupId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PinWithoutImageDto &&
    other.id == id &&
    other.creationDate == creationDate &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.creationUser == creationUser &&
    other.groupId == groupId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (creationDate.hashCode) +
    (latitude.hashCode) +
    (longitude.hashCode) +
    (creationUser.hashCode) +
    (groupId.hashCode);

  @override
  String toString() => 'PinWithoutImageDto[id=$id, creationDate=$creationDate, latitude=$latitude, longitude=$longitude, creationUser=$creationUser, groupId=$groupId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'creationDate'] = this.creationDate.toUtc().toIso8601String();
      json[r'latitude'] = this.latitude;
      json[r'longitude'] = this.longitude;
      json[r'creationUser'] = this.creationUser;
      json[r'groupId'] = this.groupId;
    return json;
  }

  /// Returns a new [PinWithoutImageDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PinWithoutImageDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PinWithoutImageDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PinWithoutImageDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PinWithoutImageDto(
        id: mapValueOfType<String>(json, r'id')!,
        creationDate: mapDateTime(json, r'creationDate', r'')!,
        latitude: num.parse('${json[r'latitude']}'),
        longitude: num.parse('${json[r'longitude']}'),
        creationUser: mapValueOfType<String>(json, r'creationUser')!,
        groupId: mapValueOfType<String>(json, r'groupId')!,
      );
    }
    return null;
  }

  static List<PinWithoutImageDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PinWithoutImageDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PinWithoutImageDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PinWithoutImageDto> mapFromJson(dynamic json) {
    final map = <String, PinWithoutImageDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PinWithoutImageDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PinWithoutImageDto-objects as value to a dart map
  static Map<String, List<PinWithoutImageDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PinWithoutImageDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PinWithoutImageDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'creationDate',
    'latitude',
    'longitude',
    'creationUser',
    'groupId',
  };
}

