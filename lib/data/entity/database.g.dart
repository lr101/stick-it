// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserEntityTable extends UserEntity
    with TableInfo<$UserEntityTable, UserEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<Uint8List> profileImage =
      GeneratedColumn<Uint8List>('profile_image', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _profileImageSmallMeta =
      const VerificationMeta('profileImageSmall');
  @override
  late final GeneratedColumn<Uint8List> profileImageSmall =
      GeneratedColumn<Uint8List>('profile_image_small', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, username, profileImage, profileImageSmall];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_entity';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    if (data.containsKey('profile_image_small')) {
      context.handle(
          _profileImageSmallMeta,
          profileImageSmall.isAcceptableOrUnknown(
              data['profile_image_small']!, _profileImageSmallMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntityData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}profile_image']),
      profileImageSmall: attachedDatabase.typeMapping.read(
          DriftSqlType.blob, data['${effectivePrefix}profile_image_small']),
    );
  }

  @override
  $UserEntityTable createAlias(String alias) {
    return $UserEntityTable(attachedDatabase, alias);
  }
}

class UserEntityData extends DataClass implements Insertable<UserEntityData> {
  final String userId;
  final String username;
  final Uint8List? profileImage;
  final Uint8List? profileImageSmall;
  const UserEntityData(
      {required this.userId,
      required this.username,
      this.profileImage,
      this.profileImageSmall});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<Uint8List>(profileImage);
    }
    if (!nullToAbsent || profileImageSmall != null) {
      map['profile_image_small'] = Variable<Uint8List>(profileImageSmall);
    }
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      userId: Value(userId),
      username: Value(username),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
      profileImageSmall: profileImageSmall == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImageSmall),
    );
  }

  factory UserEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntityData(
      userId: serializer.fromJson<String>(json['userId']),
      username: serializer.fromJson<String>(json['username']),
      profileImage: serializer.fromJson<Uint8List?>(json['profileImage']),
      profileImageSmall:
          serializer.fromJson<Uint8List?>(json['profileImageSmall']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'username': serializer.toJson<String>(username),
      'profileImage': serializer.toJson<Uint8List?>(profileImage),
      'profileImageSmall': serializer.toJson<Uint8List?>(profileImageSmall),
    };
  }

  UserEntityData copyWith(
          {String? userId,
          String? username,
          Value<Uint8List?> profileImage = const Value.absent(),
          Value<Uint8List?> profileImageSmall = const Value.absent()}) =>
      UserEntityData(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
        profileImageSmall: profileImageSmall.present
            ? profileImageSmall.value
            : this.profileImageSmall,
      );
  UserEntityData copyWithCompanion(UserEntityCompanion data) {
    return UserEntityData(
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      profileImageSmall: data.profileImageSmall.present
          ? data.profileImageSmall.value
          : this.profileImageSmall,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityData(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage, ')
          ..write('profileImageSmall: $profileImageSmall')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      username,
      $driftBlobEquality.hash(profileImage),
      $driftBlobEquality.hash(profileImageSmall));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntityData &&
          other.userId == this.userId &&
          other.username == this.username &&
          $driftBlobEquality.equals(other.profileImage, this.profileImage) &&
          $driftBlobEquality.equals(
              other.profileImageSmall, this.profileImageSmall));
}

class UserEntityCompanion extends UpdateCompanion<UserEntityData> {
  final Value<String> userId;
  final Value<String> username;
  final Value<Uint8List?> profileImage;
  final Value<Uint8List?> profileImageSmall;
  final Value<int> rowid;
  const UserEntityCompanion({
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.profileImageSmall = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserEntityCompanion.insert({
    required String userId,
    required String username,
    this.profileImage = const Value.absent(),
    this.profileImageSmall = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        username = Value(username);
  static Insertable<UserEntityData> custom({
    Expression<String>? userId,
    Expression<String>? username,
    Expression<Uint8List>? profileImage,
    Expression<Uint8List>? profileImageSmall,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (profileImage != null) 'profile_image': profileImage,
      if (profileImageSmall != null) 'profile_image_small': profileImageSmall,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserEntityCompanion copyWith(
      {Value<String>? userId,
      Value<String>? username,
      Value<Uint8List?>? profileImage,
      Value<Uint8List?>? profileImageSmall,
      Value<int>? rowid}) {
    return UserEntityCompanion(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      profileImageSmall: profileImageSmall ?? this.profileImageSmall,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<Uint8List>(profileImage.value);
    }
    if (profileImageSmall.present) {
      map['profile_image_small'] = Variable<Uint8List>(profileImageSmall.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityCompanion(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage, ')
          ..write('profileImageSmall: $profileImageSmall, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupEntityTable extends GroupEntity
    with TableInfo<$GroupEntityTable, GroupEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visibilityMeta =
      const VerificationMeta('visibility');
  @override
  late final GeneratedColumn<int> visibility = GeneratedColumn<int>(
      'visibility', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inviteUrlMeta =
      const VerificationMeta('inviteUrl');
  @override
  late final GeneratedColumn<String> inviteUrl = GeneratedColumn<String>(
      'invite_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupAdminMeta =
      const VerificationMeta('groupAdmin');
  @override
  late final GeneratedColumn<String> groupAdmin = GeneratedColumn<String>(
      'group_admin', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_entity (user_id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<Uint8List> profileImage =
      GeneratedColumn<Uint8List>('profile_image', aliasedName, false,
          type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _pinImageMeta =
      const VerificationMeta('pinImage');
  @override
  late final GeneratedColumn<Uint8List> pinImage = GeneratedColumn<Uint8List>(
      'pin_image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _isActivatedMeta =
      const VerificationMeta('isActivated');
  @override
  late final GeneratedColumn<bool> isActivated = GeneratedColumn<bool>(
      'is_activated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_activated" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        groupId,
        name,
        visibility,
        inviteUrl,
        groupAdmin,
        description,
        profileImage,
        pinImage,
        isActivated,
        lastUpdated,
        link
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_entity';
  @override
  VerificationContext validateIntegrity(Insertable<GroupEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('visibility')) {
      context.handle(
          _visibilityMeta,
          visibility.isAcceptableOrUnknown(
              data['visibility']!, _visibilityMeta));
    } else if (isInserting) {
      context.missing(_visibilityMeta);
    }
    if (data.containsKey('invite_url')) {
      context.handle(_inviteUrlMeta,
          inviteUrl.isAcceptableOrUnknown(data['invite_url']!, _inviteUrlMeta));
    }
    if (data.containsKey('group_admin')) {
      context.handle(
          _groupAdminMeta,
          groupAdmin.isAcceptableOrUnknown(
              data['group_admin']!, _groupAdminMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    if (data.containsKey('pin_image')) {
      context.handle(_pinImageMeta,
          pinImage.isAcceptableOrUnknown(data['pin_image']!, _pinImageMeta));
    } else if (isInserting) {
      context.missing(_pinImageMeta);
    }
    if (data.containsKey('is_activated')) {
      context.handle(
          _isActivatedMeta,
          isActivated.isAcceptableOrUnknown(
              data['is_activated']!, _isActivatedMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId};
  @override
  GroupEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupEntityData(
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      visibility: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}visibility'])!,
      inviteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invite_url']),
      groupAdmin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_admin']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}profile_image'])!,
      pinImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}pin_image'])!,
      isActivated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_activated'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
    );
  }

  @override
  $GroupEntityTable createAlias(String alias) {
    return $GroupEntityTable(attachedDatabase, alias);
  }
}

class GroupEntityData extends DataClass implements Insertable<GroupEntityData> {
  final String groupId;
  final String name;
  final int visibility;
  final String? inviteUrl;
  final String? groupAdmin;
  final String? description;
  final Uint8List profileImage;
  final Uint8List pinImage;
  final bool isActivated;
  final DateTime? lastUpdated;
  final String? link;
  const GroupEntityData(
      {required this.groupId,
      required this.name,
      required this.visibility,
      this.inviteUrl,
      this.groupAdmin,
      this.description,
      required this.profileImage,
      required this.pinImage,
      required this.isActivated,
      this.lastUpdated,
      this.link});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['name'] = Variable<String>(name);
    map['visibility'] = Variable<int>(visibility);
    if (!nullToAbsent || inviteUrl != null) {
      map['invite_url'] = Variable<String>(inviteUrl);
    }
    if (!nullToAbsent || groupAdmin != null) {
      map['group_admin'] = Variable<String>(groupAdmin);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['profile_image'] = Variable<Uint8List>(profileImage);
    map['pin_image'] = Variable<Uint8List>(pinImage);
    map['is_activated'] = Variable<bool>(isActivated);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    return map;
  }

  GroupEntityCompanion toCompanion(bool nullToAbsent) {
    return GroupEntityCompanion(
      groupId: Value(groupId),
      name: Value(name),
      visibility: Value(visibility),
      inviteUrl: inviteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteUrl),
      groupAdmin: groupAdmin == null && nullToAbsent
          ? const Value.absent()
          : Value(groupAdmin),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      profileImage: Value(profileImage),
      pinImage: Value(pinImage),
      isActivated: Value(isActivated),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  factory GroupEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupEntityData(
      groupId: serializer.fromJson<String>(json['groupId']),
      name: serializer.fromJson<String>(json['name']),
      visibility: serializer.fromJson<int>(json['visibility']),
      inviteUrl: serializer.fromJson<String?>(json['inviteUrl']),
      groupAdmin: serializer.fromJson<String?>(json['groupAdmin']),
      description: serializer.fromJson<String?>(json['description']),
      profileImage: serializer.fromJson<Uint8List>(json['profileImage']),
      pinImage: serializer.fromJson<Uint8List>(json['pinImage']),
      isActivated: serializer.fromJson<bool>(json['isActivated']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      link: serializer.fromJson<String?>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'name': serializer.toJson<String>(name),
      'visibility': serializer.toJson<int>(visibility),
      'inviteUrl': serializer.toJson<String?>(inviteUrl),
      'groupAdmin': serializer.toJson<String?>(groupAdmin),
      'description': serializer.toJson<String?>(description),
      'profileImage': serializer.toJson<Uint8List>(profileImage),
      'pinImage': serializer.toJson<Uint8List>(pinImage),
      'isActivated': serializer.toJson<bool>(isActivated),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'link': serializer.toJson<String?>(link),
    };
  }

  GroupEntityData copyWith(
          {String? groupId,
          String? name,
          int? visibility,
          Value<String?> inviteUrl = const Value.absent(),
          Value<String?> groupAdmin = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Uint8List? profileImage,
          Uint8List? pinImage,
          bool? isActivated,
          Value<DateTime?> lastUpdated = const Value.absent(),
          Value<String?> link = const Value.absent()}) =>
      GroupEntityData(
        groupId: groupId ?? this.groupId,
        name: name ?? this.name,
        visibility: visibility ?? this.visibility,
        inviteUrl: inviteUrl.present ? inviteUrl.value : this.inviteUrl,
        groupAdmin: groupAdmin.present ? groupAdmin.value : this.groupAdmin,
        description: description.present ? description.value : this.description,
        profileImage: profileImage ?? this.profileImage,
        pinImage: pinImage ?? this.pinImage,
        isActivated: isActivated ?? this.isActivated,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
        link: link.present ? link.value : this.link,
      );
  GroupEntityData copyWithCompanion(GroupEntityCompanion data) {
    return GroupEntityData(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      name: data.name.present ? data.name.value : this.name,
      visibility:
          data.visibility.present ? data.visibility.value : this.visibility,
      inviteUrl: data.inviteUrl.present ? data.inviteUrl.value : this.inviteUrl,
      groupAdmin:
          data.groupAdmin.present ? data.groupAdmin.value : this.groupAdmin,
      description:
          data.description.present ? data.description.value : this.description,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      pinImage: data.pinImage.present ? data.pinImage.value : this.pinImage,
      isActivated:
          data.isActivated.present ? data.isActivated.value : this.isActivated,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
      link: data.link.present ? data.link.value : this.link,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupEntityData(')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('visibility: $visibility, ')
          ..write('inviteUrl: $inviteUrl, ')
          ..write('groupAdmin: $groupAdmin, ')
          ..write('description: $description, ')
          ..write('profileImage: $profileImage, ')
          ..write('pinImage: $pinImage, ')
          ..write('isActivated: $isActivated, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      groupId,
      name,
      visibility,
      inviteUrl,
      groupAdmin,
      description,
      $driftBlobEquality.hash(profileImage),
      $driftBlobEquality.hash(pinImage),
      isActivated,
      lastUpdated,
      link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupEntityData &&
          other.groupId == this.groupId &&
          other.name == this.name &&
          other.visibility == this.visibility &&
          other.inviteUrl == this.inviteUrl &&
          other.groupAdmin == this.groupAdmin &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.profileImage, this.profileImage) &&
          $driftBlobEquality.equals(other.pinImage, this.pinImage) &&
          other.isActivated == this.isActivated &&
          other.lastUpdated == this.lastUpdated &&
          other.link == this.link);
}

class GroupEntityCompanion extends UpdateCompanion<GroupEntityData> {
  final Value<String> groupId;
  final Value<String> name;
  final Value<int> visibility;
  final Value<String?> inviteUrl;
  final Value<String?> groupAdmin;
  final Value<String?> description;
  final Value<Uint8List> profileImage;
  final Value<Uint8List> pinImage;
  final Value<bool> isActivated;
  final Value<DateTime?> lastUpdated;
  final Value<String?> link;
  final Value<int> rowid;
  const GroupEntityCompanion({
    this.groupId = const Value.absent(),
    this.name = const Value.absent(),
    this.visibility = const Value.absent(),
    this.inviteUrl = const Value.absent(),
    this.groupAdmin = const Value.absent(),
    this.description = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.pinImage = const Value.absent(),
    this.isActivated = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.link = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupEntityCompanion.insert({
    required String groupId,
    required String name,
    required int visibility,
    this.inviteUrl = const Value.absent(),
    this.groupAdmin = const Value.absent(),
    this.description = const Value.absent(),
    required Uint8List profileImage,
    required Uint8List pinImage,
    this.isActivated = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.link = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        name = Value(name),
        visibility = Value(visibility),
        profileImage = Value(profileImage),
        pinImage = Value(pinImage);
  static Insertable<GroupEntityData> custom({
    Expression<String>? groupId,
    Expression<String>? name,
    Expression<int>? visibility,
    Expression<String>? inviteUrl,
    Expression<String>? groupAdmin,
    Expression<String>? description,
    Expression<Uint8List>? profileImage,
    Expression<Uint8List>? pinImage,
    Expression<bool>? isActivated,
    Expression<DateTime>? lastUpdated,
    Expression<String>? link,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (name != null) 'name': name,
      if (visibility != null) 'visibility': visibility,
      if (inviteUrl != null) 'invite_url': inviteUrl,
      if (groupAdmin != null) 'group_admin': groupAdmin,
      if (description != null) 'description': description,
      if (profileImage != null) 'profile_image': profileImage,
      if (pinImage != null) 'pin_image': pinImage,
      if (isActivated != null) 'is_activated': isActivated,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (link != null) 'link': link,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupEntityCompanion copyWith(
      {Value<String>? groupId,
      Value<String>? name,
      Value<int>? visibility,
      Value<String?>? inviteUrl,
      Value<String?>? groupAdmin,
      Value<String?>? description,
      Value<Uint8List>? profileImage,
      Value<Uint8List>? pinImage,
      Value<bool>? isActivated,
      Value<DateTime?>? lastUpdated,
      Value<String?>? link,
      Value<int>? rowid}) {
    return GroupEntityCompanion(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      visibility: visibility ?? this.visibility,
      inviteUrl: inviteUrl ?? this.inviteUrl,
      groupAdmin: groupAdmin ?? this.groupAdmin,
      description: description ?? this.description,
      profileImage: profileImage ?? this.profileImage,
      pinImage: pinImage ?? this.pinImage,
      isActivated: isActivated ?? this.isActivated,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      link: link ?? this.link,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<int>(visibility.value);
    }
    if (inviteUrl.present) {
      map['invite_url'] = Variable<String>(inviteUrl.value);
    }
    if (groupAdmin.present) {
      map['group_admin'] = Variable<String>(groupAdmin.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<Uint8List>(profileImage.value);
    }
    if (pinImage.present) {
      map['pin_image'] = Variable<Uint8List>(pinImage.value);
    }
    if (isActivated.present) {
      map['is_activated'] = Variable<bool>(isActivated.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupEntityCompanion(')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('visibility: $visibility, ')
          ..write('inviteUrl: $inviteUrl, ')
          ..write('groupAdmin: $groupAdmin, ')
          ..write('description: $description, ')
          ..write('profileImage: $profileImage, ')
          ..write('pinImage: $pinImage, ')
          ..write('isActivated: $isActivated, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('link: $link, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PinEntityTable extends PinEntity
    with TableInfo<$PinEntityTable, PinEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PinEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pinIdMeta = const VerificationMeta('pinId');
  @override
  late final GeneratedColumn<String> pinId = GeneratedColumn<String>(
      'pin_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _creatorMeta =
      const VerificationMeta('creator');
  @override
  late final GeneratedColumn<String> creator = GeneratedColumn<String>(
      'creator', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_entity (user_id)'));
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
      'group', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES group_entity (group_id)'));
  static const VerificationMeta _isHiddenMeta =
      const VerificationMeta('isHidden');
  @override
  late final GeneratedColumn<bool> isHidden = GeneratedColumn<bool>(
      'is_hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_hidden" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        pinId,
        latitude,
        longitude,
        creationDate,
        creator,
        group,
        isHidden,
        image
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pin_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PinEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pin_id')) {
      context.handle(
          _pinIdMeta, pinId.isAcceptableOrUnknown(data['pin_id']!, _pinIdMeta));
    } else if (isInserting) {
      context.missing(_pinIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('creator')) {
      context.handle(_creatorMeta,
          creator.isAcceptableOrUnknown(data['creator']!, _creatorMeta));
    } else if (isInserting) {
      context.missing(_creatorMeta);
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('is_hidden')) {
      context.handle(_isHiddenMeta,
          isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pinId};
  @override
  PinEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PinEntityData(
      pinId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin_id'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      creator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}creator'])!,
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group'])!,
      isHidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_hidden'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
    );
  }

  @override
  $PinEntityTable createAlias(String alias) {
    return $PinEntityTable(attachedDatabase, alias);
  }
}

class PinEntityData extends DataClass implements Insertable<PinEntityData> {
  final String pinId;
  final double latitude;
  final double longitude;
  final DateTime creationDate;
  final String creator;
  final String group;
  final bool isHidden;
  final Uint8List? image;
  const PinEntityData(
      {required this.pinId,
      required this.latitude,
      required this.longitude,
      required this.creationDate,
      required this.creator,
      required this.group,
      required this.isHidden,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pin_id'] = Variable<String>(pinId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['creator'] = Variable<String>(creator);
    map['group'] = Variable<String>(group);
    map['is_hidden'] = Variable<bool>(isHidden);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    return map;
  }

  PinEntityCompanion toCompanion(bool nullToAbsent) {
    return PinEntityCompanion(
      pinId: Value(pinId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      creationDate: Value(creationDate),
      creator: Value(creator),
      group: Value(group),
      isHidden: Value(isHidden),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory PinEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PinEntityData(
      pinId: serializer.fromJson<String>(json['pinId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      creator: serializer.fromJson<String>(json['creator']),
      group: serializer.fromJson<String>(json['group']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
      image: serializer.fromJson<Uint8List?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pinId': serializer.toJson<String>(pinId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'creator': serializer.toJson<String>(creator),
      'group': serializer.toJson<String>(group),
      'isHidden': serializer.toJson<bool>(isHidden),
      'image': serializer.toJson<Uint8List?>(image),
    };
  }

  PinEntityData copyWith(
          {String? pinId,
          double? latitude,
          double? longitude,
          DateTime? creationDate,
          String? creator,
          String? group,
          bool? isHidden,
          Value<Uint8List?> image = const Value.absent()}) =>
      PinEntityData(
        pinId: pinId ?? this.pinId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        creationDate: creationDate ?? this.creationDate,
        creator: creator ?? this.creator,
        group: group ?? this.group,
        isHidden: isHidden ?? this.isHidden,
        image: image.present ? image.value : this.image,
      );
  PinEntityData copyWithCompanion(PinEntityCompanion data) {
    return PinEntityData(
      pinId: data.pinId.present ? data.pinId.value : this.pinId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
      creator: data.creator.present ? data.creator.value : this.creator,
      group: data.group.present ? data.group.value : this.group,
      isHidden: data.isHidden.present ? data.isHidden.value : this.isHidden,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PinEntityData(')
          ..write('pinId: $pinId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('creationDate: $creationDate, ')
          ..write('creator: $creator, ')
          ..write('group: $group, ')
          ..write('isHidden: $isHidden, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pinId, latitude, longitude, creationDate,
      creator, group, isHidden, $driftBlobEquality.hash(image));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PinEntityData &&
          other.pinId == this.pinId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.creationDate == this.creationDate &&
          other.creator == this.creator &&
          other.group == this.group &&
          other.isHidden == this.isHidden &&
          $driftBlobEquality.equals(other.image, this.image));
}

class PinEntityCompanion extends UpdateCompanion<PinEntityData> {
  final Value<String> pinId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> creationDate;
  final Value<String> creator;
  final Value<String> group;
  final Value<bool> isHidden;
  final Value<Uint8List?> image;
  final Value<int> rowid;
  const PinEntityCompanion({
    this.pinId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.creator = const Value.absent(),
    this.group = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PinEntityCompanion.insert({
    required String pinId,
    required double latitude,
    required double longitude,
    required DateTime creationDate,
    required String creator,
    required String group,
    this.isHidden = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pinId = Value(pinId),
        latitude = Value(latitude),
        longitude = Value(longitude),
        creationDate = Value(creationDate),
        creator = Value(creator),
        group = Value(group);
  static Insertable<PinEntityData> custom({
    Expression<String>? pinId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? creationDate,
    Expression<String>? creator,
    Expression<String>? group,
    Expression<bool>? isHidden,
    Expression<Uint8List>? image,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pinId != null) 'pin_id': pinId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (creationDate != null) 'creation_date': creationDate,
      if (creator != null) 'creator': creator,
      if (group != null) 'group': group,
      if (isHidden != null) 'is_hidden': isHidden,
      if (image != null) 'image': image,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PinEntityCompanion copyWith(
      {Value<String>? pinId,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<DateTime>? creationDate,
      Value<String>? creator,
      Value<String>? group,
      Value<bool>? isHidden,
      Value<Uint8List?>? image,
      Value<int>? rowid}) {
    return PinEntityCompanion(
      pinId: pinId ?? this.pinId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      creationDate: creationDate ?? this.creationDate,
      creator: creator ?? this.creator,
      group: group ?? this.group,
      isHidden: isHidden ?? this.isHidden,
      image: image ?? this.image,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pinId.present) {
      map['pin_id'] = Variable<String>(pinId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (creator.present) {
      map['creator'] = Variable<String>(creator.value);
    }
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool>(isHidden.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PinEntityCompanion(')
          ..write('pinId: $pinId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('creationDate: $creationDate, ')
          ..write('creator: $creator, ')
          ..write('group: $group, ')
          ..write('isHidden: $isHidden, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberEntityTable extends MemberEntity
    with TableInfo<$MemberEntityTable, MemberEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [groupId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MemberEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId, userId};
  @override
  MemberEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemberEntityData(
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $MemberEntityTable createAlias(String alias) {
    return $MemberEntityTable(attachedDatabase, alias);
  }
}

class MemberEntityData extends DataClass
    implements Insertable<MemberEntityData> {
  final String groupId;
  final String userId;
  const MemberEntityData({required this.groupId, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['user_id'] = Variable<String>(userId);
    return map;
  }

  MemberEntityCompanion toCompanion(bool nullToAbsent) {
    return MemberEntityCompanion(
      groupId: Value(groupId),
      userId: Value(userId),
    );
  }

  factory MemberEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberEntityData(
      groupId: serializer.fromJson<String>(json['groupId']),
      userId: serializer.fromJson<String>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'userId': serializer.toJson<String>(userId),
    };
  }

  MemberEntityData copyWith({String? groupId, String? userId}) =>
      MemberEntityData(
        groupId: groupId ?? this.groupId,
        userId: userId ?? this.userId,
      );
  MemberEntityData copyWithCompanion(MemberEntityCompanion data) {
    return MemberEntityData(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemberEntityData(')
          ..write('groupId: $groupId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberEntityData &&
          other.groupId == this.groupId &&
          other.userId == this.userId);
}

class MemberEntityCompanion extends UpdateCompanion<MemberEntityData> {
  final Value<String> groupId;
  final Value<String> userId;
  final Value<int> rowid;
  const MemberEntityCompanion({
    this.groupId = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberEntityCompanion.insert({
    required String groupId,
    required String userId,
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        userId = Value(userId);
  static Insertable<MemberEntityData> custom({
    Expression<String>? groupId,
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberEntityCompanion copyWith(
      {Value<String>? groupId, Value<String>? userId, Value<int>? rowid}) {
    return MemberEntityCompanion(
      groupId: groupId ?? this.groupId,
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberEntityCompanion(')
          ..write('groupId: $groupId, ')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UserEntityTable userEntity = $UserEntityTable(this);
  late final $GroupEntityTable groupEntity = $GroupEntityTable(this);
  late final $PinEntityTable pinEntity = $PinEntityTable(this);
  late final $MemberEntityTable memberEntity = $MemberEntityTable(this);
  late final Index userUsername = Index(
      'user_username', 'CREATE INDEX user_username ON user_entity (username)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userEntity, groupEntity, pinEntity, memberEntity, userUsername];
}

typedef $$UserEntityTableCreateCompanionBuilder = UserEntityCompanion Function({
  required String userId,
  required String username,
  Value<Uint8List?> profileImage,
  Value<Uint8List?> profileImageSmall,
  Value<int> rowid,
});
typedef $$UserEntityTableUpdateCompanionBuilder = UserEntityCompanion Function({
  Value<String> userId,
  Value<String> username,
  Value<Uint8List?> profileImage,
  Value<Uint8List?> profileImageSmall,
  Value<int> rowid,
});

final class $$UserEntityTableReferences
    extends BaseReferences<_$Database, $UserEntityTable, UserEntityData> {
  $$UserEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GroupEntityTable, List<GroupEntityData>>
      _groupEntityRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.groupEntity,
              aliasName: $_aliasNameGenerator(
                  db.userEntity.userId, db.groupEntity.groupAdmin));

  $$GroupEntityTableProcessedTableManager get groupEntityRefs {
    final manager = $$GroupEntityTableTableManager($_db, $_db.groupEntity)
        .filter((f) => f.groupAdmin.userId($_item.userId));

    final cache = $_typedResult.readTableOrNull(_groupEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PinEntityTable, List<PinEntityData>>
      _pinEntityRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.pinEntity,
          aliasName:
              $_aliasNameGenerator(db.userEntity.userId, db.pinEntity.creator));

  $$PinEntityTableProcessedTableManager get pinEntityRefs {
    final manager = $$PinEntityTableTableManager($_db, $_db.pinEntity)
        .filter((f) => f.creator.userId($_item.userId));

    final cache = $_typedResult.readTableOrNull(_pinEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UserEntityTableFilterComposer
    extends FilterComposer<_$Database, $UserEntityTable> {
  $$UserEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get profileImage => $state.composableBuilder(
      column: $state.table.profileImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get profileImageSmall => $state.composableBuilder(
      column: $state.table.profileImageSmall,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter groupEntityRefs(
      ComposableFilter Function($$GroupEntityTableFilterComposer f) f) {
    final $$GroupEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.groupEntity,
        getReferencedColumn: (t) => t.groupAdmin,
        builder: (joinBuilder, parentComposers) =>
            $$GroupEntityTableFilterComposer(ComposerState($state.db,
                $state.db.groupEntity, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter pinEntityRefs(
      ComposableFilter Function($$PinEntityTableFilterComposer f) f) {
    final $$PinEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.pinEntity,
        getReferencedColumn: (t) => t.creator,
        builder: (joinBuilder, parentComposers) =>
            $$PinEntityTableFilterComposer(ComposerState(
                $state.db, $state.db.pinEntity, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UserEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $UserEntityTable> {
  $$UserEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get profileImage => $state.composableBuilder(
      column: $state.table.profileImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get profileImageSmall => $state.composableBuilder(
      column: $state.table.profileImageSmall,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserEntityTableTableManager extends RootTableManager<
    _$Database,
    $UserEntityTable,
    UserEntityData,
    $$UserEntityTableFilterComposer,
    $$UserEntityTableOrderingComposer,
    $$UserEntityTableCreateCompanionBuilder,
    $$UserEntityTableUpdateCompanionBuilder,
    (UserEntityData, $$UserEntityTableReferences),
    UserEntityData,
    PrefetchHooks Function({bool groupEntityRefs, bool pinEntityRefs})> {
  $$UserEntityTableTableManager(_$Database db, $UserEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<Uint8List?> profileImage = const Value.absent(),
            Value<Uint8List?> profileImageSmall = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion(
            userId: userId,
            username: username,
            profileImage: profileImage,
            profileImageSmall: profileImageSmall,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String username,
            Value<Uint8List?> profileImage = const Value.absent(),
            Value<Uint8List?> profileImageSmall = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion.insert(
            userId: userId,
            username: username,
            profileImage: profileImage,
            profileImageSmall: profileImageSmall,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {groupEntityRefs = false, pinEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (groupEntityRefs) db.groupEntity,
                if (pinEntityRefs) db.pinEntity
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (groupEntityRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UserEntityTableReferences
                            ._groupEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserEntityTableReferences(db, table, p0)
                                .groupEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupAdmin == item.userId),
                        typedResults: items),
                  if (pinEntityRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UserEntityTableReferences._pinEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserEntityTableReferences(db, table, p0)
                                .pinEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.creator == item.userId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UserEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UserEntityTable,
    UserEntityData,
    $$UserEntityTableFilterComposer,
    $$UserEntityTableOrderingComposer,
    $$UserEntityTableCreateCompanionBuilder,
    $$UserEntityTableUpdateCompanionBuilder,
    (UserEntityData, $$UserEntityTableReferences),
    UserEntityData,
    PrefetchHooks Function({bool groupEntityRefs, bool pinEntityRefs})>;
typedef $$GroupEntityTableCreateCompanionBuilder = GroupEntityCompanion
    Function({
  required String groupId,
  required String name,
  required int visibility,
  Value<String?> inviteUrl,
  Value<String?> groupAdmin,
  Value<String?> description,
  required Uint8List profileImage,
  required Uint8List pinImage,
  Value<bool> isActivated,
  Value<DateTime?> lastUpdated,
  Value<String?> link,
  Value<int> rowid,
});
typedef $$GroupEntityTableUpdateCompanionBuilder = GroupEntityCompanion
    Function({
  Value<String> groupId,
  Value<String> name,
  Value<int> visibility,
  Value<String?> inviteUrl,
  Value<String?> groupAdmin,
  Value<String?> description,
  Value<Uint8List> profileImage,
  Value<Uint8List> pinImage,
  Value<bool> isActivated,
  Value<DateTime?> lastUpdated,
  Value<String?> link,
  Value<int> rowid,
});

final class $$GroupEntityTableReferences
    extends BaseReferences<_$Database, $GroupEntityTable, GroupEntityData> {
  $$GroupEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserEntityTable _groupAdminTable(_$Database db) =>
      db.userEntity.createAlias($_aliasNameGenerator(
          db.groupEntity.groupAdmin, db.userEntity.userId));

  $$UserEntityTableProcessedTableManager? get groupAdmin {
    if ($_item.groupAdmin == null) return null;
    final manager = $$UserEntityTableTableManager($_db, $_db.userEntity)
        .filter((f) => f.userId($_item.groupAdmin!));
    final item = $_typedResult.readTableOrNull(_groupAdminTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PinEntityTable, List<PinEntityData>>
      _pinEntityRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.pinEntity,
          aliasName:
              $_aliasNameGenerator(db.groupEntity.groupId, db.pinEntity.group));

  $$PinEntityTableProcessedTableManager get pinEntityRefs {
    final manager = $$PinEntityTableTableManager($_db, $_db.pinEntity)
        .filter((f) => f.group.groupId($_item.groupId));

    final cache = $_typedResult.readTableOrNull(_pinEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GroupEntityTableFilterComposer
    extends FilterComposer<_$Database, $GroupEntityTable> {
  $$GroupEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get visibility => $state.composableBuilder(
      column: $state.table.visibility,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get inviteUrl => $state.composableBuilder(
      column: $state.table.inviteUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get profileImage => $state.composableBuilder(
      column: $state.table.profileImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get pinImage => $state.composableBuilder(
      column: $state.table.pinImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActivated => $state.composableBuilder(
      column: $state.table.isActivated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UserEntityTableFilterComposer get groupAdmin {
    final $$UserEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupAdmin,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableFilterComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter pinEntityRefs(
      ComposableFilter Function($$PinEntityTableFilterComposer f) f) {
    final $$PinEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.pinEntity,
        getReferencedColumn: (t) => t.group,
        builder: (joinBuilder, parentComposers) =>
            $$PinEntityTableFilterComposer(ComposerState(
                $state.db, $state.db.pinEntity, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GroupEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $GroupEntityTable> {
  $$GroupEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get visibility => $state.composableBuilder(
      column: $state.table.visibility,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get inviteUrl => $state.composableBuilder(
      column: $state.table.inviteUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get profileImage => $state.composableBuilder(
      column: $state.table.profileImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get pinImage => $state.composableBuilder(
      column: $state.table.pinImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActivated => $state.composableBuilder(
      column: $state.table.isActivated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UserEntityTableOrderingComposer get groupAdmin {
    final $$UserEntityTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupAdmin,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableOrderingComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$GroupEntityTableTableManager extends RootTableManager<
    _$Database,
    $GroupEntityTable,
    GroupEntityData,
    $$GroupEntityTableFilterComposer,
    $$GroupEntityTableOrderingComposer,
    $$GroupEntityTableCreateCompanionBuilder,
    $$GroupEntityTableUpdateCompanionBuilder,
    (GroupEntityData, $$GroupEntityTableReferences),
    GroupEntityData,
    PrefetchHooks Function({bool groupAdmin, bool pinEntityRefs})> {
  $$GroupEntityTableTableManager(_$Database db, $GroupEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GroupEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GroupEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> visibility = const Value.absent(),
            Value<String?> inviteUrl = const Value.absent(),
            Value<String?> groupAdmin = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Uint8List> profileImage = const Value.absent(),
            Value<Uint8List> pinImage = const Value.absent(),
            Value<bool> isActivated = const Value.absent(),
            Value<DateTime?> lastUpdated = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupEntityCompanion(
            groupId: groupId,
            name: name,
            visibility: visibility,
            inviteUrl: inviteUrl,
            groupAdmin: groupAdmin,
            description: description,
            profileImage: profileImage,
            pinImage: pinImage,
            isActivated: isActivated,
            lastUpdated: lastUpdated,
            link: link,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String name,
            required int visibility,
            Value<String?> inviteUrl = const Value.absent(),
            Value<String?> groupAdmin = const Value.absent(),
            Value<String?> description = const Value.absent(),
            required Uint8List profileImage,
            required Uint8List pinImage,
            Value<bool> isActivated = const Value.absent(),
            Value<DateTime?> lastUpdated = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupEntityCompanion.insert(
            groupId: groupId,
            name: name,
            visibility: visibility,
            inviteUrl: inviteUrl,
            groupAdmin: groupAdmin,
            description: description,
            profileImage: profileImage,
            pinImage: pinImage,
            isActivated: isActivated,
            lastUpdated: lastUpdated,
            link: link,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroupEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groupAdmin = false, pinEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pinEntityRefs) db.pinEntity],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupAdmin) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupAdmin,
                    referencedTable:
                        $$GroupEntityTableReferences._groupAdminTable(db),
                    referencedColumn: $$GroupEntityTableReferences
                        ._groupAdminTable(db)
                        .userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pinEntityRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GroupEntityTableReferences
                            ._pinEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupEntityTableReferences(db, table, p0)
                                .pinEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.group == item.groupId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GroupEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GroupEntityTable,
    GroupEntityData,
    $$GroupEntityTableFilterComposer,
    $$GroupEntityTableOrderingComposer,
    $$GroupEntityTableCreateCompanionBuilder,
    $$GroupEntityTableUpdateCompanionBuilder,
    (GroupEntityData, $$GroupEntityTableReferences),
    GroupEntityData,
    PrefetchHooks Function({bool groupAdmin, bool pinEntityRefs})>;
typedef $$PinEntityTableCreateCompanionBuilder = PinEntityCompanion Function({
  required String pinId,
  required double latitude,
  required double longitude,
  required DateTime creationDate,
  required String creator,
  required String group,
  Value<bool> isHidden,
  Value<Uint8List?> image,
  Value<int> rowid,
});
typedef $$PinEntityTableUpdateCompanionBuilder = PinEntityCompanion Function({
  Value<String> pinId,
  Value<double> latitude,
  Value<double> longitude,
  Value<DateTime> creationDate,
  Value<String> creator,
  Value<String> group,
  Value<bool> isHidden,
  Value<Uint8List?> image,
  Value<int> rowid,
});

final class $$PinEntityTableReferences
    extends BaseReferences<_$Database, $PinEntityTable, PinEntityData> {
  $$PinEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserEntityTable _creatorTable(_$Database db) =>
      db.userEntity.createAlias(
          $_aliasNameGenerator(db.pinEntity.creator, db.userEntity.userId));

  $$UserEntityTableProcessedTableManager? get creator {
    if ($_item.creator == null) return null;
    final manager = $$UserEntityTableTableManager($_db, $_db.userEntity)
        .filter((f) => f.userId($_item.creator!));
    final item = $_typedResult.readTableOrNull(_creatorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GroupEntityTable _groupTable(_$Database db) =>
      db.groupEntity.createAlias(
          $_aliasNameGenerator(db.pinEntity.group, db.groupEntity.groupId));

  $$GroupEntityTableProcessedTableManager? get group {
    if ($_item.group == null) return null;
    final manager = $$GroupEntityTableTableManager($_db, $_db.groupEntity)
        .filter((f) => f.groupId($_item.group!));
    final item = $_typedResult.readTableOrNull(_groupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PinEntityTableFilterComposer
    extends FilterComposer<_$Database, $PinEntityTable> {
  $$PinEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get pinId => $state.composableBuilder(
      column: $state.table.pinId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get creationDate => $state.composableBuilder(
      column: $state.table.creationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isHidden => $state.composableBuilder(
      column: $state.table.isHidden,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UserEntityTableFilterComposer get creator {
    final $$UserEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creator,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableFilterComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }

  $$GroupEntityTableFilterComposer get group {
    final $$GroupEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $state.db.groupEntity,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder, parentComposers) =>
            $$GroupEntityTableFilterComposer(ComposerState($state.db,
                $state.db.groupEntity, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PinEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $PinEntityTable> {
  $$PinEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get pinId => $state.composableBuilder(
      column: $state.table.pinId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get creationDate => $state.composableBuilder(
      column: $state.table.creationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isHidden => $state.composableBuilder(
      column: $state.table.isHidden,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UserEntityTableOrderingComposer get creator {
    final $$UserEntityTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creator,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableOrderingComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }

  $$GroupEntityTableOrderingComposer get group {
    final $$GroupEntityTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $state.db.groupEntity,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder, parentComposers) =>
            $$GroupEntityTableOrderingComposer(ComposerState($state.db,
                $state.db.groupEntity, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PinEntityTableTableManager extends RootTableManager<
    _$Database,
    $PinEntityTable,
    PinEntityData,
    $$PinEntityTableFilterComposer,
    $$PinEntityTableOrderingComposer,
    $$PinEntityTableCreateCompanionBuilder,
    $$PinEntityTableUpdateCompanionBuilder,
    (PinEntityData, $$PinEntityTableReferences),
    PinEntityData,
    PrefetchHooks Function({bool creator, bool group})> {
  $$PinEntityTableTableManager(_$Database db, $PinEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PinEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PinEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> pinId = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<DateTime> creationDate = const Value.absent(),
            Value<String> creator = const Value.absent(),
            Value<String> group = const Value.absent(),
            Value<bool> isHidden = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinEntityCompanion(
            pinId: pinId,
            latitude: latitude,
            longitude: longitude,
            creationDate: creationDate,
            creator: creator,
            group: group,
            isHidden: isHidden,
            image: image,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pinId,
            required double latitude,
            required double longitude,
            required DateTime creationDate,
            required String creator,
            required String group,
            Value<bool> isHidden = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinEntityCompanion.insert(
            pinId: pinId,
            latitude: latitude,
            longitude: longitude,
            creationDate: creationDate,
            creator: creator,
            group: group,
            isHidden: isHidden,
            image: image,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PinEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({creator = false, group = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (creator) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.creator,
                    referencedTable:
                        $$PinEntityTableReferences._creatorTable(db),
                    referencedColumn:
                        $$PinEntityTableReferences._creatorTable(db).userId,
                  ) as T;
                }
                if (group) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.group,
                    referencedTable: $$PinEntityTableReferences._groupTable(db),
                    referencedColumn:
                        $$PinEntityTableReferences._groupTable(db).groupId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PinEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $PinEntityTable,
    PinEntityData,
    $$PinEntityTableFilterComposer,
    $$PinEntityTableOrderingComposer,
    $$PinEntityTableCreateCompanionBuilder,
    $$PinEntityTableUpdateCompanionBuilder,
    (PinEntityData, $$PinEntityTableReferences),
    PinEntityData,
    PrefetchHooks Function({bool creator, bool group})>;
typedef $$MemberEntityTableCreateCompanionBuilder = MemberEntityCompanion
    Function({
  required String groupId,
  required String userId,
  Value<int> rowid,
});
typedef $$MemberEntityTableUpdateCompanionBuilder = MemberEntityCompanion
    Function({
  Value<String> groupId,
  Value<String> userId,
  Value<int> rowid,
});

class $$MemberEntityTableFilterComposer
    extends FilterComposer<_$Database, $MemberEntityTable> {
  $$MemberEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MemberEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $MemberEntityTable> {
  $$MemberEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$MemberEntityTableTableManager extends RootTableManager<
    _$Database,
    $MemberEntityTable,
    MemberEntityData,
    $$MemberEntityTableFilterComposer,
    $$MemberEntityTableOrderingComposer,
    $$MemberEntityTableCreateCompanionBuilder,
    $$MemberEntityTableUpdateCompanionBuilder,
    (
      MemberEntityData,
      BaseReferences<_$Database, $MemberEntityTable, MemberEntityData>
    ),
    MemberEntityData,
    PrefetchHooks Function()> {
  $$MemberEntityTableTableManager(_$Database db, $MemberEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MemberEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MemberEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MemberEntityCompanion(
            groupId: groupId,
            userId: userId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String userId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MemberEntityCompanion.insert(
            groupId: groupId,
            userId: userId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MemberEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MemberEntityTable,
    MemberEntityData,
    $$MemberEntityTableFilterComposer,
    $$MemberEntityTableOrderingComposer,
    $$MemberEntityTableCreateCompanionBuilder,
    $$MemberEntityTableUpdateCompanionBuilder,
    (
      MemberEntityData,
      BaseReferences<_$Database, $MemberEntityTable, MemberEntityData>
    ),
    MemberEntityData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UserEntityTableTableManager get userEntity =>
      $$UserEntityTableTableManager(_db, _db.userEntity);
  $$GroupEntityTableTableManager get groupEntity =>
      $$GroupEntityTableTableManager(_db, _db.groupEntity);
  $$PinEntityTableTableManager get pinEntity =>
      $$PinEntityTableTableManager(_db, _db.pinEntity);
  $$MemberEntityTableTableManager get memberEntity =>
      $$MemberEntityTableTableManager(_db, _db.memberEntity);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'b75e890cd139885a1a0cc0aed2268e451201765d';

/// See also [database].
@ProviderFor(database)
final databaseProvider = Provider<Database>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = ProviderRef<Database>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
