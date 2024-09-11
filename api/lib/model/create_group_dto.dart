//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateGroupDto {
  /// Returns a new [CreateGroupDto] instance.
  CreateGroupDto({
    required this.description,
    required this.name,
    required this.profileImage,
    required this.visibility,
    required this.groupAdmin,
    required this.link,
  });

  String description;

  String name;

  String profileImage;

  Visibility visibility;

  String groupAdmin;

  String link;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateGroupDto &&
    other.description == description &&
    other.name == name &&
    other.profileImage == profileImage &&
    other.visibility == visibility &&
    other.groupAdmin == groupAdmin &&
    other.link == link;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (name.hashCode) +
    (profileImage.hashCode) +
    (visibility.hashCode) +
    (groupAdmin.hashCode) +
    (link.hashCode);

  @override
  String toString() => 'CreateGroupDto[description=$description, name=$name, profileImage=$profileImage, visibility=$visibility, groupAdmin=$groupAdmin, link=$link]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'name'] = this.name;
      json[r'profileImage'] = this.profileImage;
      json[r'visibility'] = this.visibility;
      json[r'groupAdmin'] = this.groupAdmin;
      json[r'link'] = this.link;
    return json;
  }

  /// Returns a new [CreateGroupDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateGroupDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateGroupDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateGroupDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateGroupDto(
        description: mapValueOfType<String>(json, r'description')!,
        name: mapValueOfType<String>(json, r'name')!,
        profileImage: mapValueOfType<String>(json, r'profileImage')!,
        visibility: Visibility.fromJson(json[r'visibility'])!,
        groupAdmin: mapValueOfType<String>(json, r'groupAdmin')!,
        link: mapValueOfType<String>(json, r'link')!,
      );
    }
    return null;
  }

  static List<CreateGroupDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateGroupDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateGroupDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateGroupDto> mapFromJson(dynamic json) {
    final map = <String, CreateGroupDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateGroupDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateGroupDto-objects as value to a dart map
  static Map<String, List<CreateGroupDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateGroupDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateGroupDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'name',
    'profileImage',
    'visibility',
    'groupAdmin',
    'link',
  };
}
