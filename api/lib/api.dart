//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/groups_api.dart';
part 'api/members_api.dart';
part 'api/pins_api.dart';
part 'api/public_api.dart';
part 'api/report_api.dart';
part 'api/users_api.dart';

part 'model/create_group_dto.dart';
part 'model/group_dto.dart';
part 'model/info_dto.dart';
part 'model/member_response_dto.dart';
part 'model/pin_request_dto.dart';
part 'model/pin_with_optional_image_dto.dart';
part 'model/pin_without_image_dto.dart';
part 'model/profile_image_response_dto.dart';
part 'model/ranking_response_dto.dart';
part 'model/report_dto.dart';
part 'model/token_response_dto.dart';
part 'model/update_group_dto.dart';
part 'model/user_info_dto.dart';
part 'model/user_login_request.dart';
part 'model/user_request_dto.dart';
part 'model/user_update_dto.dart';
part 'model/visibility.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';