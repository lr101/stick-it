//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Status {
  /// Returns a new [Status] instance.
  Status({
    this.notifications = const [],
    required this.tokenValidity,
  });

  List<String> notifications;

  DateTime tokenValidity;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Status &&
    _deepEquality.equals(other.notifications, notifications) &&
    other.tokenValidity == tokenValidity;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notifications.hashCode) +
    (tokenValidity.hashCode);

  @override
  String toString() => 'Status[notifications=$notifications, tokenValidity=$tokenValidity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'notifications'] = this.notifications;
      json[r'token-validity'] = this.tokenValidity.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [Status] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Status? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Status[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Status[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Status(
        notifications: json[r'notifications'] is Iterable
            ? (json[r'notifications'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        tokenValidity: mapDateTime(json, r'token-validity', r'')!,
      );
    }
    return null;
  }

  static List<Status> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Status>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Status.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Status> mapFromJson(dynamic json) {
    final map = <String, Status>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Status.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Status-objects as value to a dart map
  static Map<String, List<Status>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Status>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Status.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'notifications',
    'token-validity',
  };
}
