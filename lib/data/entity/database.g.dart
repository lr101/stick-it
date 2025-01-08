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
  static const VerificationMeta _selectedBatchMeta =
      const VerificationMeta('selectedBatch');
  @override
  late final GeneratedColumn<int> selectedBatch = GeneratedColumn<int>(
      'selected_batch', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [userId, username, selectedBatch];
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
    if (data.containsKey('selected_batch')) {
      context.handle(
          _selectedBatchMeta,
          selectedBatch.isAcceptableOrUnknown(
              data['selected_batch']!, _selectedBatchMeta));
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
      selectedBatch: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}selected_batch']),
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
  final int? selectedBatch;
  const UserEntityData(
      {required this.userId, required this.username, this.selectedBatch});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || selectedBatch != null) {
      map['selected_batch'] = Variable<int>(selectedBatch);
    }
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      userId: Value(userId),
      username: Value(username),
      selectedBatch: selectedBatch == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedBatch),
    );
  }

  factory UserEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntityData(
      userId: serializer.fromJson<String>(json['userId']),
      username: serializer.fromJson<String>(json['username']),
      selectedBatch: serializer.fromJson<int?>(json['selectedBatch']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'username': serializer.toJson<String>(username),
      'selectedBatch': serializer.toJson<int?>(selectedBatch),
    };
  }

  UserEntityData copyWith(
          {String? userId,
          String? username,
          Value<int?> selectedBatch = const Value.absent()}) =>
      UserEntityData(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        selectedBatch:
            selectedBatch.present ? selectedBatch.value : this.selectedBatch,
      );
  UserEntityData copyWithCompanion(UserEntityCompanion data) {
    return UserEntityData(
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      selectedBatch: data.selectedBatch.present
          ? data.selectedBatch.value
          : this.selectedBatch,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityData(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('selectedBatch: $selectedBatch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, username, selectedBatch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntityData &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.selectedBatch == this.selectedBatch);
}

class UserEntityCompanion extends UpdateCompanion<UserEntityData> {
  final Value<String> userId;
  final Value<String> username;
  final Value<int?> selectedBatch;
  final Value<int> rowid;
  const UserEntityCompanion({
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.selectedBatch = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserEntityCompanion.insert({
    required String userId,
    required String username,
    this.selectedBatch = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        username = Value(username);
  static Insertable<UserEntityData> custom({
    Expression<String>? userId,
    Expression<String>? username,
    Expression<int>? selectedBatch,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (selectedBatch != null) 'selected_batch': selectedBatch,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserEntityCompanion copyWith(
      {Value<String>? userId,
      Value<String>? username,
      Value<int?>? selectedBatch,
      Value<int>? rowid}) {
    return UserEntityCompanion(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      selectedBatch: selectedBatch ?? this.selectedBatch,
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
    if (selectedBatch.present) {
      map['selected_batch'] = Variable<int>(selectedBatch.value);
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
          ..write('selectedBatch: $selectedBatch, ')
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
          ..write('isActivated: $isActivated, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupId, name, visibility, inviteUrl,
      groupAdmin, description, isActivated, lastUpdated, link);
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
    this.isActivated = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.link = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        name = Value(name),
        visibility = Value(visibility);
  static Insertable<GroupEntityData> custom({
    Expression<String>? groupId,
    Expression<String>? name,
    Expression<int>? visibility,
    Expression<String>? inviteUrl,
    Expression<String>? groupAdmin,
    Expression<String>? description,
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _lastSyncedMeta =
      const VerificationMeta('lastSynced');
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
      'last_synced', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        pinId,
        latitude,
        longitude,
        creationDate,
        description,
        creator,
        group,
        isHidden,
        lastSynced
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
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
    if (data.containsKey('last_synced')) {
      context.handle(
          _lastSyncedMeta,
          lastSynced.isAcceptableOrUnknown(
              data['last_synced']!, _lastSyncedMeta));
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      creator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}creator'])!,
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group'])!,
      isHidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_hidden'])!,
      lastSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_synced']),
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
  final String? description;
  final String creator;
  final String group;
  final bool isHidden;
  final DateTime? lastSynced;
  const PinEntityData(
      {required this.pinId,
      required this.latitude,
      required this.longitude,
      required this.creationDate,
      this.description,
      required this.creator,
      required this.group,
      required this.isHidden,
      this.lastSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pin_id'] = Variable<String>(pinId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['creation_date'] = Variable<DateTime>(creationDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['creator'] = Variable<String>(creator);
    map['group'] = Variable<String>(group);
    map['is_hidden'] = Variable<bool>(isHidden);
    if (!nullToAbsent || lastSynced != null) {
      map['last_synced'] = Variable<DateTime>(lastSynced);
    }
    return map;
  }

  PinEntityCompanion toCompanion(bool nullToAbsent) {
    return PinEntityCompanion(
      pinId: Value(pinId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      creationDate: Value(creationDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      creator: Value(creator),
      group: Value(group),
      isHidden: Value(isHidden),
      lastSynced: lastSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynced),
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
      description: serializer.fromJson<String?>(json['description']),
      creator: serializer.fromJson<String>(json['creator']),
      group: serializer.fromJson<String>(json['group']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
      lastSynced: serializer.fromJson<DateTime?>(json['lastSynced']),
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
      'description': serializer.toJson<String?>(description),
      'creator': serializer.toJson<String>(creator),
      'group': serializer.toJson<String>(group),
      'isHidden': serializer.toJson<bool>(isHidden),
      'lastSynced': serializer.toJson<DateTime?>(lastSynced),
    };
  }

  PinEntityData copyWith(
          {String? pinId,
          double? latitude,
          double? longitude,
          DateTime? creationDate,
          Value<String?> description = const Value.absent(),
          String? creator,
          String? group,
          bool? isHidden,
          Value<DateTime?> lastSynced = const Value.absent()}) =>
      PinEntityData(
        pinId: pinId ?? this.pinId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        creationDate: creationDate ?? this.creationDate,
        description: description.present ? description.value : this.description,
        creator: creator ?? this.creator,
        group: group ?? this.group,
        isHidden: isHidden ?? this.isHidden,
        lastSynced: lastSynced.present ? lastSynced.value : this.lastSynced,
      );
  PinEntityData copyWithCompanion(PinEntityCompanion data) {
    return PinEntityData(
      pinId: data.pinId.present ? data.pinId.value : this.pinId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
      description:
          data.description.present ? data.description.value : this.description,
      creator: data.creator.present ? data.creator.value : this.creator,
      group: data.group.present ? data.group.value : this.group,
      isHidden: data.isHidden.present ? data.isHidden.value : this.isHidden,
      lastSynced:
          data.lastSynced.present ? data.lastSynced.value : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PinEntityData(')
          ..write('pinId: $pinId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('creationDate: $creationDate, ')
          ..write('description: $description, ')
          ..write('creator: $creator, ')
          ..write('group: $group, ')
          ..write('isHidden: $isHidden, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pinId, latitude, longitude, creationDate,
      description, creator, group, isHidden, lastSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PinEntityData &&
          other.pinId == this.pinId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.creationDate == this.creationDate &&
          other.description == this.description &&
          other.creator == this.creator &&
          other.group == this.group &&
          other.isHidden == this.isHidden &&
          other.lastSynced == this.lastSynced);
}

class PinEntityCompanion extends UpdateCompanion<PinEntityData> {
  final Value<String> pinId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> creationDate;
  final Value<String?> description;
  final Value<String> creator;
  final Value<String> group;
  final Value<bool> isHidden;
  final Value<DateTime?> lastSynced;
  final Value<int> rowid;
  const PinEntityCompanion({
    this.pinId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.description = const Value.absent(),
    this.creator = const Value.absent(),
    this.group = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PinEntityCompanion.insert({
    required String pinId,
    required double latitude,
    required double longitude,
    required DateTime creationDate,
    this.description = const Value.absent(),
    required String creator,
    required String group,
    this.isHidden = const Value.absent(),
    this.lastSynced = const Value.absent(),
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
    Expression<String>? description,
    Expression<String>? creator,
    Expression<String>? group,
    Expression<bool>? isHidden,
    Expression<DateTime>? lastSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pinId != null) 'pin_id': pinId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (creationDate != null) 'creation_date': creationDate,
      if (description != null) 'description': description,
      if (creator != null) 'creator': creator,
      if (group != null) 'group': group,
      if (isHidden != null) 'is_hidden': isHidden,
      if (lastSynced != null) 'last_synced': lastSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PinEntityCompanion copyWith(
      {Value<String>? pinId,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<DateTime>? creationDate,
      Value<String?>? description,
      Value<String>? creator,
      Value<String>? group,
      Value<bool>? isHidden,
      Value<DateTime?>? lastSynced,
      Value<int>? rowid}) {
    return PinEntityCompanion(
      pinId: pinId ?? this.pinId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      creationDate: creationDate ?? this.creationDate,
      description: description ?? this.description,
      creator: creator ?? this.creator,
      group: group ?? this.group,
      isHidden: isHidden ?? this.isHidden,
      lastSynced: lastSynced ?? this.lastSynced,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
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
          ..write('description: $description, ')
          ..write('creator: $creator, ')
          ..write('group: $group, ')
          ..write('isHidden: $isHidden, ')
          ..write('lastSynced: $lastSynced, ')
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
  static const VerificationMeta _rankingMeta =
      const VerificationMeta('ranking');
  @override
  late final GeneratedColumn<int> ranking = GeneratedColumn<int>(
      'ranking', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [groupId, userId, ranking];
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
    if (data.containsKey('ranking')) {
      context.handle(_rankingMeta,
          ranking.isAcceptableOrUnknown(data['ranking']!, _rankingMeta));
    } else if (isInserting) {
      context.missing(_rankingMeta);
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
      ranking: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ranking'])!,
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
  final int ranking;
  const MemberEntityData(
      {required this.groupId, required this.userId, required this.ranking});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['user_id'] = Variable<String>(userId);
    map['ranking'] = Variable<int>(ranking);
    return map;
  }

  MemberEntityCompanion toCompanion(bool nullToAbsent) {
    return MemberEntityCompanion(
      groupId: Value(groupId),
      userId: Value(userId),
      ranking: Value(ranking),
    );
  }

  factory MemberEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberEntityData(
      groupId: serializer.fromJson<String>(json['groupId']),
      userId: serializer.fromJson<String>(json['userId']),
      ranking: serializer.fromJson<int>(json['ranking']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'userId': serializer.toJson<String>(userId),
      'ranking': serializer.toJson<int>(ranking),
    };
  }

  MemberEntityData copyWith({String? groupId, String? userId, int? ranking}) =>
      MemberEntityData(
        groupId: groupId ?? this.groupId,
        userId: userId ?? this.userId,
        ranking: ranking ?? this.ranking,
      );
  MemberEntityData copyWithCompanion(MemberEntityCompanion data) {
    return MemberEntityData(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      userId: data.userId.present ? data.userId.value : this.userId,
      ranking: data.ranking.present ? data.ranking.value : this.ranking,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemberEntityData(')
          ..write('groupId: $groupId, ')
          ..write('userId: $userId, ')
          ..write('ranking: $ranking')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupId, userId, ranking);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberEntityData &&
          other.groupId == this.groupId &&
          other.userId == this.userId &&
          other.ranking == this.ranking);
}

class MemberEntityCompanion extends UpdateCompanion<MemberEntityData> {
  final Value<String> groupId;
  final Value<String> userId;
  final Value<int> ranking;
  final Value<int> rowid;
  const MemberEntityCompanion({
    this.groupId = const Value.absent(),
    this.userId = const Value.absent(),
    this.ranking = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberEntityCompanion.insert({
    required String groupId,
    required String userId,
    required int ranking,
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        userId = Value(userId),
        ranking = Value(ranking);
  static Insertable<MemberEntityData> custom({
    Expression<String>? groupId,
    Expression<String>? userId,
    Expression<int>? ranking,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (userId != null) 'user_id': userId,
      if (ranking != null) 'ranking': ranking,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberEntityCompanion copyWith(
      {Value<String>? groupId,
      Value<String>? userId,
      Value<int>? ranking,
      Value<int>? rowid}) {
    return MemberEntityCompanion(
      groupId: groupId ?? this.groupId,
      userId: userId ?? this.userId,
      ranking: ranking ?? this.ranking,
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
    if (ranking.present) {
      map['ranking'] = Variable<int>(ranking.value);
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
          ..write('ranking: $ranking, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PinImageEntityTable extends PinImageEntity
    with TableInfo<$PinImageEntityTable, PinImageEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PinImageEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _pinIdMeta = const VerificationMeta('pinId');
  @override
  late final GeneratedColumn<String> pinId = GeneratedColumn<String>(
      'pin_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hitCountMeta =
      const VerificationMeta('hitCount');
  @override
  late final GeneratedColumn<int> hitCount = GeneratedColumn<int>(
      'hit_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  static const VerificationMeta _lastAccessedMeta =
      const VerificationMeta('lastAccessed');
  @override
  late final GeneratedColumn<DateTime> lastAccessed = GeneratedColumn<DateTime>(
      'last_accessed', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _keepAliveMeta =
      const VerificationMeta('keepAlive');
  @override
  late final GeneratedColumn<bool> keepAlive = GeneratedColumn<bool>(
      'keep_alive', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("keep_alive" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [image, pinId, hitCount, lastAccessed, keepAlive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pin_image_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PinImageEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('pin_id')) {
      context.handle(
          _pinIdMeta, pinId.isAcceptableOrUnknown(data['pin_id']!, _pinIdMeta));
    } else if (isInserting) {
      context.missing(_pinIdMeta);
    }
    if (data.containsKey('hit_count')) {
      context.handle(_hitCountMeta,
          hitCount.isAcceptableOrUnknown(data['hit_count']!, _hitCountMeta));
    }
    if (data.containsKey('last_accessed')) {
      context.handle(
          _lastAccessedMeta,
          lastAccessed.isAcceptableOrUnknown(
              data['last_accessed']!, _lastAccessedMeta));
    }
    if (data.containsKey('keep_alive')) {
      context.handle(_keepAliveMeta,
          keepAlive.isAcceptableOrUnknown(data['keep_alive']!, _keepAliveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pinId};
  @override
  PinImageEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PinImageEntityData(
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image'])!,
      pinId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin_id'])!,
      hitCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hit_count'])!,
      lastAccessed: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed'])!,
      keepAlive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}keep_alive'])!,
    );
  }

  @override
  $PinImageEntityTable createAlias(String alias) {
    return $PinImageEntityTable(attachedDatabase, alias);
  }
}

class PinImageEntityData extends DataClass
    implements Insertable<PinImageEntityData> {
  final Uint8List image;
  final String pinId;
  final int hitCount;
  final DateTime lastAccessed;
  final bool keepAlive;
  const PinImageEntityData(
      {required this.image,
      required this.pinId,
      required this.hitCount,
      required this.lastAccessed,
      required this.keepAlive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['image'] = Variable<Uint8List>(image);
    map['pin_id'] = Variable<String>(pinId);
    map['hit_count'] = Variable<int>(hitCount);
    map['last_accessed'] = Variable<DateTime>(lastAccessed);
    map['keep_alive'] = Variable<bool>(keepAlive);
    return map;
  }

  PinImageEntityCompanion toCompanion(bool nullToAbsent) {
    return PinImageEntityCompanion(
      image: Value(image),
      pinId: Value(pinId),
      hitCount: Value(hitCount),
      lastAccessed: Value(lastAccessed),
      keepAlive: Value(keepAlive),
    );
  }

  factory PinImageEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PinImageEntityData(
      image: serializer.fromJson<Uint8List>(json['image']),
      pinId: serializer.fromJson<String>(json['pinId']),
      hitCount: serializer.fromJson<int>(json['hitCount']),
      lastAccessed: serializer.fromJson<DateTime>(json['lastAccessed']),
      keepAlive: serializer.fromJson<bool>(json['keepAlive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'image': serializer.toJson<Uint8List>(image),
      'pinId': serializer.toJson<String>(pinId),
      'hitCount': serializer.toJson<int>(hitCount),
      'lastAccessed': serializer.toJson<DateTime>(lastAccessed),
      'keepAlive': serializer.toJson<bool>(keepAlive),
    };
  }

  PinImageEntityData copyWith(
          {Uint8List? image,
          String? pinId,
          int? hitCount,
          DateTime? lastAccessed,
          bool? keepAlive}) =>
      PinImageEntityData(
        image: image ?? this.image,
        pinId: pinId ?? this.pinId,
        hitCount: hitCount ?? this.hitCount,
        lastAccessed: lastAccessed ?? this.lastAccessed,
        keepAlive: keepAlive ?? this.keepAlive,
      );
  PinImageEntityData copyWithCompanion(PinImageEntityCompanion data) {
    return PinImageEntityData(
      image: data.image.present ? data.image.value : this.image,
      pinId: data.pinId.present ? data.pinId.value : this.pinId,
      hitCount: data.hitCount.present ? data.hitCount.value : this.hitCount,
      lastAccessed: data.lastAccessed.present
          ? data.lastAccessed.value
          : this.lastAccessed,
      keepAlive: data.keepAlive.present ? data.keepAlive.value : this.keepAlive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PinImageEntityData(')
          ..write('image: $image, ')
          ..write('pinId: $pinId, ')
          ..write('hitCount: $hitCount, ')
          ..write('lastAccessed: $lastAccessed, ')
          ..write('keepAlive: $keepAlive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      $driftBlobEquality.hash(image), pinId, hitCount, lastAccessed, keepAlive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PinImageEntityData &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.pinId == this.pinId &&
          other.hitCount == this.hitCount &&
          other.lastAccessed == this.lastAccessed &&
          other.keepAlive == this.keepAlive);
}

class PinImageEntityCompanion extends UpdateCompanion<PinImageEntityData> {
  final Value<Uint8List> image;
  final Value<String> pinId;
  final Value<int> hitCount;
  final Value<DateTime> lastAccessed;
  final Value<bool> keepAlive;
  final Value<int> rowid;
  const PinImageEntityCompanion({
    this.image = const Value.absent(),
    this.pinId = const Value.absent(),
    this.hitCount = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.keepAlive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PinImageEntityCompanion.insert({
    required Uint8List image,
    required String pinId,
    this.hitCount = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.keepAlive = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : image = Value(image),
        pinId = Value(pinId);
  static Insertable<PinImageEntityData> custom({
    Expression<Uint8List>? image,
    Expression<String>? pinId,
    Expression<int>? hitCount,
    Expression<DateTime>? lastAccessed,
    Expression<bool>? keepAlive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (image != null) 'image': image,
      if (pinId != null) 'pin_id': pinId,
      if (hitCount != null) 'hit_count': hitCount,
      if (lastAccessed != null) 'last_accessed': lastAccessed,
      if (keepAlive != null) 'keep_alive': keepAlive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PinImageEntityCompanion copyWith(
      {Value<Uint8List>? image,
      Value<String>? pinId,
      Value<int>? hitCount,
      Value<DateTime>? lastAccessed,
      Value<bool>? keepAlive,
      Value<int>? rowid}) {
    return PinImageEntityCompanion(
      image: image ?? this.image,
      pinId: pinId ?? this.pinId,
      hitCount: hitCount ?? this.hitCount,
      lastAccessed: lastAccessed ?? this.lastAccessed,
      keepAlive: keepAlive ?? this.keepAlive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (pinId.present) {
      map['pin_id'] = Variable<String>(pinId.value);
    }
    if (hitCount.present) {
      map['hit_count'] = Variable<int>(hitCount.value);
    }
    if (lastAccessed.present) {
      map['last_accessed'] = Variable<DateTime>(lastAccessed.value);
    }
    if (keepAlive.present) {
      map['keep_alive'] = Variable<bool>(keepAlive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PinImageEntityCompanion(')
          ..write('image: $image, ')
          ..write('pinId: $pinId, ')
          ..write('hitCount: $hitCount, ')
          ..write('lastAccessed: $lastAccessed, ')
          ..write('keepAlive: $keepAlive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupImageEntityTable extends GroupImageEntity
    with TableInfo<$GroupImageEntityTable, GroupImageEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupImageEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<Uint8List> profileImage =
      GeneratedColumn<Uint8List>('profile_image', aliasedName, false,
          type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _profileImageSmallMeta =
      const VerificationMeta('profileImageSmall');
  @override
  late final GeneratedColumn<Uint8List> profileImageSmall =
      GeneratedColumn<Uint8List>('profile_image_small', aliasedName, false,
          type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _pinImageMeta =
      const VerificationMeta('pinImage');
  @override
  late final GeneratedColumn<Uint8List> pinImage = GeneratedColumn<Uint8List>(
      'pin_image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [profileImage, profileImageSmall, pinImage, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_image_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<GroupImageEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    if (data.containsKey('profile_image_small')) {
      context.handle(
          _profileImageSmallMeta,
          profileImageSmall.isAcceptableOrUnknown(
              data['profile_image_small']!, _profileImageSmallMeta));
    } else if (isInserting) {
      context.missing(_profileImageSmallMeta);
    }
    if (data.containsKey('pin_image')) {
      context.handle(_pinImageMeta,
          pinImage.isAcceptableOrUnknown(data['pin_image']!, _pinImageMeta));
    } else if (isInserting) {
      context.missing(_pinImageMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId};
  @override
  GroupImageEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupImageEntityData(
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}profile_image'])!,
      profileImageSmall: attachedDatabase.typeMapping.read(
          DriftSqlType.blob, data['${effectivePrefix}profile_image_small'])!,
      pinImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}pin_image'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $GroupImageEntityTable createAlias(String alias) {
    return $GroupImageEntityTable(attachedDatabase, alias);
  }
}

class GroupImageEntityData extends DataClass
    implements Insertable<GroupImageEntityData> {
  final Uint8List profileImage;
  final Uint8List profileImageSmall;
  final Uint8List pinImage;
  final String groupId;
  const GroupImageEntityData(
      {required this.profileImage,
      required this.profileImageSmall,
      required this.pinImage,
      required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_image'] = Variable<Uint8List>(profileImage);
    map['profile_image_small'] = Variable<Uint8List>(profileImageSmall);
    map['pin_image'] = Variable<Uint8List>(pinImage);
    map['group_id'] = Variable<String>(groupId);
    return map;
  }

  GroupImageEntityCompanion toCompanion(bool nullToAbsent) {
    return GroupImageEntityCompanion(
      profileImage: Value(profileImage),
      profileImageSmall: Value(profileImageSmall),
      pinImage: Value(pinImage),
      groupId: Value(groupId),
    );
  }

  factory GroupImageEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupImageEntityData(
      profileImage: serializer.fromJson<Uint8List>(json['profileImage']),
      profileImageSmall:
          serializer.fromJson<Uint8List>(json['profileImageSmall']),
      pinImage: serializer.fromJson<Uint8List>(json['pinImage']),
      groupId: serializer.fromJson<String>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profileImage': serializer.toJson<Uint8List>(profileImage),
      'profileImageSmall': serializer.toJson<Uint8List>(profileImageSmall),
      'pinImage': serializer.toJson<Uint8List>(pinImage),
      'groupId': serializer.toJson<String>(groupId),
    };
  }

  GroupImageEntityData copyWith(
          {Uint8List? profileImage,
          Uint8List? profileImageSmall,
          Uint8List? pinImage,
          String? groupId}) =>
      GroupImageEntityData(
        profileImage: profileImage ?? this.profileImage,
        profileImageSmall: profileImageSmall ?? this.profileImageSmall,
        pinImage: pinImage ?? this.pinImage,
        groupId: groupId ?? this.groupId,
      );
  GroupImageEntityData copyWithCompanion(GroupImageEntityCompanion data) {
    return GroupImageEntityData(
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      profileImageSmall: data.profileImageSmall.present
          ? data.profileImageSmall.value
          : this.profileImageSmall,
      pinImage: data.pinImage.present ? data.pinImage.value : this.pinImage,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupImageEntityData(')
          ..write('profileImage: $profileImage, ')
          ..write('profileImageSmall: $profileImageSmall, ')
          ..write('pinImage: $pinImage, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      $driftBlobEquality.hash(profileImage),
      $driftBlobEquality.hash(profileImageSmall),
      $driftBlobEquality.hash(pinImage),
      groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupImageEntityData &&
          $driftBlobEquality.equals(other.profileImage, this.profileImage) &&
          $driftBlobEquality.equals(
              other.profileImageSmall, this.profileImageSmall) &&
          $driftBlobEquality.equals(other.pinImage, this.pinImage) &&
          other.groupId == this.groupId);
}

class GroupImageEntityCompanion extends UpdateCompanion<GroupImageEntityData> {
  final Value<Uint8List> profileImage;
  final Value<Uint8List> profileImageSmall;
  final Value<Uint8List> pinImage;
  final Value<String> groupId;
  final Value<int> rowid;
  const GroupImageEntityCompanion({
    this.profileImage = const Value.absent(),
    this.profileImageSmall = const Value.absent(),
    this.pinImage = const Value.absent(),
    this.groupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupImageEntityCompanion.insert({
    required Uint8List profileImage,
    required Uint8List profileImageSmall,
    required Uint8List pinImage,
    required String groupId,
    this.rowid = const Value.absent(),
  })  : profileImage = Value(profileImage),
        profileImageSmall = Value(profileImageSmall),
        pinImage = Value(pinImage),
        groupId = Value(groupId);
  static Insertable<GroupImageEntityData> custom({
    Expression<Uint8List>? profileImage,
    Expression<Uint8List>? profileImageSmall,
    Expression<Uint8List>? pinImage,
    Expression<String>? groupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileImage != null) 'profile_image': profileImage,
      if (profileImageSmall != null) 'profile_image_small': profileImageSmall,
      if (pinImage != null) 'pin_image': pinImage,
      if (groupId != null) 'group_id': groupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupImageEntityCompanion copyWith(
      {Value<Uint8List>? profileImage,
      Value<Uint8List>? profileImageSmall,
      Value<Uint8List>? pinImage,
      Value<String>? groupId,
      Value<int>? rowid}) {
    return GroupImageEntityCompanion(
      profileImage: profileImage ?? this.profileImage,
      profileImageSmall: profileImageSmall ?? this.profileImageSmall,
      pinImage: pinImage ?? this.pinImage,
      groupId: groupId ?? this.groupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileImage.present) {
      map['profile_image'] = Variable<Uint8List>(profileImage.value);
    }
    if (profileImageSmall.present) {
      map['profile_image_small'] = Variable<Uint8List>(profileImageSmall.value);
    }
    if (pinImage.present) {
      map['pin_image'] = Variable<Uint8List>(pinImage.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupImageEntityCompanion(')
          ..write('profileImage: $profileImage, ')
          ..write('profileImageSmall: $profileImageSmall, ')
          ..write('pinImage: $pinImage, ')
          ..write('groupId: $groupId, ')
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
  late final $PinImageEntityTable pinImageEntity = $PinImageEntityTable(this);
  late final $GroupImageEntityTable groupImageEntity =
      $GroupImageEntityTable(this);
  late final Index userUsername = Index(
      'user_username', 'CREATE INDEX user_username ON user_entity (username)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userEntity,
        groupEntity,
        pinEntity,
        memberEntity,
        pinImageEntity,
        groupImageEntity,
        userUsername
      ];
}

typedef $$UserEntityTableCreateCompanionBuilder = UserEntityCompanion Function({
  required String userId,
  required String username,
  Value<int?> selectedBatch,
  Value<int> rowid,
});
typedef $$UserEntityTableUpdateCompanionBuilder = UserEntityCompanion Function({
  Value<String> userId,
  Value<String> username,
  Value<int?> selectedBatch,
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
    extends Composer<_$Database, $UserEntityTable> {
  $$UserEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedBatch => $composableBuilder(
      column: $table.selectedBatch, builder: (column) => ColumnFilters(column));

  Expression<bool> groupEntityRefs(
      Expression<bool> Function($$GroupEntityTableFilterComposer f) f) {
    final $$GroupEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.groupEntity,
        getReferencedColumn: (t) => t.groupAdmin,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupEntityTableFilterComposer(
              $db: $db,
              $table: $db.groupEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pinEntityRefs(
      Expression<bool> Function($$PinEntityTableFilterComposer f) f) {
    final $$PinEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.pinEntity,
        getReferencedColumn: (t) => t.creator,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PinEntityTableFilterComposer(
              $db: $db,
              $table: $db.pinEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserEntityTableOrderingComposer
    extends Composer<_$Database, $UserEntityTable> {
  $$UserEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedBatch => $composableBuilder(
      column: $table.selectedBatch,
      builder: (column) => ColumnOrderings(column));
}

class $$UserEntityTableAnnotationComposer
    extends Composer<_$Database, $UserEntityTable> {
  $$UserEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<int> get selectedBatch => $composableBuilder(
      column: $table.selectedBatch, builder: (column) => column);

  Expression<T> groupEntityRefs<T extends Object>(
      Expression<T> Function($$GroupEntityTableAnnotationComposer a) f) {
    final $$GroupEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.groupEntity,
        getReferencedColumn: (t) => t.groupAdmin,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.groupEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pinEntityRefs<T extends Object>(
      Expression<T> Function($$PinEntityTableAnnotationComposer a) f) {
    final $$PinEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.pinEntity,
        getReferencedColumn: (t) => t.creator,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PinEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pinEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserEntityTableTableManager extends RootTableManager<
    _$Database,
    $UserEntityTable,
    UserEntityData,
    $$UserEntityTableFilterComposer,
    $$UserEntityTableOrderingComposer,
    $$UserEntityTableAnnotationComposer,
    $$UserEntityTableCreateCompanionBuilder,
    $$UserEntityTableUpdateCompanionBuilder,
    (UserEntityData, $$UserEntityTableReferences),
    UserEntityData,
    PrefetchHooks Function({bool groupEntityRefs, bool pinEntityRefs})> {
  $$UserEntityTableTableManager(_$Database db, $UserEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<int?> selectedBatch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion(
            userId: userId,
            username: username,
            selectedBatch: selectedBatch,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String username,
            Value<int?> selectedBatch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion.insert(
            userId: userId,
            username: username,
            selectedBatch: selectedBatch,
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
    $$UserEntityTableAnnotationComposer,
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
    extends Composer<_$Database, $GroupEntityTable> {
  $$GroupEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get inviteUrl => $composableBuilder(
      column: $table.inviteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  $$UserEntityTableFilterComposer get groupAdmin {
    final $$UserEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupAdmin,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableFilterComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> pinEntityRefs(
      Expression<bool> Function($$PinEntityTableFilterComposer f) f) {
    final $$PinEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.pinEntity,
        getReferencedColumn: (t) => t.group,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PinEntityTableFilterComposer(
              $db: $db,
              $table: $db.pinEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GroupEntityTableOrderingComposer
    extends Composer<_$Database, $GroupEntityTable> {
  $$GroupEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get inviteUrl => $composableBuilder(
      column: $table.inviteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));

  $$UserEntityTableOrderingComposer get groupAdmin {
    final $$UserEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupAdmin,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableOrderingComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupEntityTableAnnotationComposer
    extends Composer<_$Database, $GroupEntityTable> {
  $$GroupEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => column);

  GeneratedColumn<String> get inviteUrl =>
      $composableBuilder(column: $table.inviteUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  $$UserEntityTableAnnotationComposer get groupAdmin {
    final $$UserEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupAdmin,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> pinEntityRefs<T extends Object>(
      Expression<T> Function($$PinEntityTableAnnotationComposer a) f) {
    final $$PinEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.pinEntity,
        getReferencedColumn: (t) => t.group,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PinEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pinEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GroupEntityTableTableManager extends RootTableManager<
    _$Database,
    $GroupEntityTable,
    GroupEntityData,
    $$GroupEntityTableFilterComposer,
    $$GroupEntityTableOrderingComposer,
    $$GroupEntityTableAnnotationComposer,
    $$GroupEntityTableCreateCompanionBuilder,
    $$GroupEntityTableUpdateCompanionBuilder,
    (GroupEntityData, $$GroupEntityTableReferences),
    GroupEntityData,
    PrefetchHooks Function({bool groupAdmin, bool pinEntityRefs})> {
  $$GroupEntityTableTableManager(_$Database db, $GroupEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> visibility = const Value.absent(),
            Value<String?> inviteUrl = const Value.absent(),
            Value<String?> groupAdmin = const Value.absent(),
            Value<String?> description = const Value.absent(),
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
    $$GroupEntityTableAnnotationComposer,
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
  Value<String?> description,
  required String creator,
  required String group,
  Value<bool> isHidden,
  Value<DateTime?> lastSynced,
  Value<int> rowid,
});
typedef $$PinEntityTableUpdateCompanionBuilder = PinEntityCompanion Function({
  Value<String> pinId,
  Value<double> latitude,
  Value<double> longitude,
  Value<DateTime> creationDate,
  Value<String?> description,
  Value<String> creator,
  Value<String> group,
  Value<bool> isHidden,
  Value<DateTime?> lastSynced,
  Value<int> rowid,
});

final class $$PinEntityTableReferences
    extends BaseReferences<_$Database, $PinEntityTable, PinEntityData> {
  $$PinEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserEntityTable _creatorTable(_$Database db) =>
      db.userEntity.createAlias(
          $_aliasNameGenerator(db.pinEntity.creator, db.userEntity.userId));

  $$UserEntityTableProcessedTableManager get creator {
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

  $$GroupEntityTableProcessedTableManager get group {
    final manager = $$GroupEntityTableTableManager($_db, $_db.groupEntity)
        .filter((f) => f.groupId($_item.group!));
    final item = $_typedResult.readTableOrNull(_groupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PinEntityTableFilterComposer
    extends Composer<_$Database, $PinEntityTable> {
  $$PinEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pinId => $composableBuilder(
      column: $table.pinId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHidden => $composableBuilder(
      column: $table.isHidden, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnFilters(column));

  $$UserEntityTableFilterComposer get creator {
    final $$UserEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creator,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableFilterComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GroupEntityTableFilterComposer get group {
    final $$GroupEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $db.groupEntity,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupEntityTableFilterComposer(
              $db: $db,
              $table: $db.groupEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PinEntityTableOrderingComposer
    extends Composer<_$Database, $PinEntityTable> {
  $$PinEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pinId => $composableBuilder(
      column: $table.pinId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHidden => $composableBuilder(
      column: $table.isHidden, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnOrderings(column));

  $$UserEntityTableOrderingComposer get creator {
    final $$UserEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creator,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableOrderingComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GroupEntityTableOrderingComposer get group {
    final $$GroupEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $db.groupEntity,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupEntityTableOrderingComposer(
              $db: $db,
              $table: $db.groupEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PinEntityTableAnnotationComposer
    extends Composer<_$Database, $PinEntityTable> {
  $$PinEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pinId =>
      $composableBuilder(column: $table.pinId, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isHidden =>
      $composableBuilder(column: $table.isHidden, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => column);

  $$UserEntityTableAnnotationComposer get creator {
    final $$UserEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creator,
        referencedTable: $db.userEntity,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.userEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GroupEntityTableAnnotationComposer get group {
    final $$GroupEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $db.groupEntity,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.groupEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PinEntityTableTableManager extends RootTableManager<
    _$Database,
    $PinEntityTable,
    PinEntityData,
    $$PinEntityTableFilterComposer,
    $$PinEntityTableOrderingComposer,
    $$PinEntityTableAnnotationComposer,
    $$PinEntityTableCreateCompanionBuilder,
    $$PinEntityTableUpdateCompanionBuilder,
    (PinEntityData, $$PinEntityTableReferences),
    PinEntityData,
    PrefetchHooks Function({bool creator, bool group})> {
  $$PinEntityTableTableManager(_$Database db, $PinEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PinEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PinEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PinEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pinId = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<DateTime> creationDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> creator = const Value.absent(),
            Value<String> group = const Value.absent(),
            Value<bool> isHidden = const Value.absent(),
            Value<DateTime?> lastSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinEntityCompanion(
            pinId: pinId,
            latitude: latitude,
            longitude: longitude,
            creationDate: creationDate,
            description: description,
            creator: creator,
            group: group,
            isHidden: isHidden,
            lastSynced: lastSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pinId,
            required double latitude,
            required double longitude,
            required DateTime creationDate,
            Value<String?> description = const Value.absent(),
            required String creator,
            required String group,
            Value<bool> isHidden = const Value.absent(),
            Value<DateTime?> lastSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinEntityCompanion.insert(
            pinId: pinId,
            latitude: latitude,
            longitude: longitude,
            creationDate: creationDate,
            description: description,
            creator: creator,
            group: group,
            isHidden: isHidden,
            lastSynced: lastSynced,
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
    $$PinEntityTableAnnotationComposer,
    $$PinEntityTableCreateCompanionBuilder,
    $$PinEntityTableUpdateCompanionBuilder,
    (PinEntityData, $$PinEntityTableReferences),
    PinEntityData,
    PrefetchHooks Function({bool creator, bool group})>;
typedef $$MemberEntityTableCreateCompanionBuilder = MemberEntityCompanion
    Function({
  required String groupId,
  required String userId,
  required int ranking,
  Value<int> rowid,
});
typedef $$MemberEntityTableUpdateCompanionBuilder = MemberEntityCompanion
    Function({
  Value<String> groupId,
  Value<String> userId,
  Value<int> ranking,
  Value<int> rowid,
});

class $$MemberEntityTableFilterComposer
    extends Composer<_$Database, $MemberEntityTable> {
  $$MemberEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ranking => $composableBuilder(
      column: $table.ranking, builder: (column) => ColumnFilters(column));
}

class $$MemberEntityTableOrderingComposer
    extends Composer<_$Database, $MemberEntityTable> {
  $$MemberEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ranking => $composableBuilder(
      column: $table.ranking, builder: (column) => ColumnOrderings(column));
}

class $$MemberEntityTableAnnotationComposer
    extends Composer<_$Database, $MemberEntityTable> {
  $$MemberEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get ranking =>
      $composableBuilder(column: $table.ranking, builder: (column) => column);
}

class $$MemberEntityTableTableManager extends RootTableManager<
    _$Database,
    $MemberEntityTable,
    MemberEntityData,
    $$MemberEntityTableFilterComposer,
    $$MemberEntityTableOrderingComposer,
    $$MemberEntityTableAnnotationComposer,
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
          createFilteringComposer: () =>
              $$MemberEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> ranking = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MemberEntityCompanion(
            groupId: groupId,
            userId: userId,
            ranking: ranking,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String userId,
            required int ranking,
            Value<int> rowid = const Value.absent(),
          }) =>
              MemberEntityCompanion.insert(
            groupId: groupId,
            userId: userId,
            ranking: ranking,
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
    $$MemberEntityTableAnnotationComposer,
    $$MemberEntityTableCreateCompanionBuilder,
    $$MemberEntityTableUpdateCompanionBuilder,
    (
      MemberEntityData,
      BaseReferences<_$Database, $MemberEntityTable, MemberEntityData>
    ),
    MemberEntityData,
    PrefetchHooks Function()>;
typedef $$PinImageEntityTableCreateCompanionBuilder = PinImageEntityCompanion
    Function({
  required Uint8List image,
  required String pinId,
  Value<int> hitCount,
  Value<DateTime> lastAccessed,
  Value<bool> keepAlive,
  Value<int> rowid,
});
typedef $$PinImageEntityTableUpdateCompanionBuilder = PinImageEntityCompanion
    Function({
  Value<Uint8List> image,
  Value<String> pinId,
  Value<int> hitCount,
  Value<DateTime> lastAccessed,
  Value<bool> keepAlive,
  Value<int> rowid,
});

class $$PinImageEntityTableFilterComposer
    extends Composer<_$Database, $PinImageEntityTable> {
  $$PinImageEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pinId => $composableBuilder(
      column: $table.pinId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hitCount => $composableBuilder(
      column: $table.hitCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get keepAlive => $composableBuilder(
      column: $table.keepAlive, builder: (column) => ColumnFilters(column));
}

class $$PinImageEntityTableOrderingComposer
    extends Composer<_$Database, $PinImageEntityTable> {
  $$PinImageEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pinId => $composableBuilder(
      column: $table.pinId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hitCount => $composableBuilder(
      column: $table.hitCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get keepAlive => $composableBuilder(
      column: $table.keepAlive, builder: (column) => ColumnOrderings(column));
}

class $$PinImageEntityTableAnnotationComposer
    extends Composer<_$Database, $PinImageEntityTable> {
  $$PinImageEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get pinId =>
      $composableBuilder(column: $table.pinId, builder: (column) => column);

  GeneratedColumn<int> get hitCount =>
      $composableBuilder(column: $table.hitCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed, builder: (column) => column);

  GeneratedColumn<bool> get keepAlive =>
      $composableBuilder(column: $table.keepAlive, builder: (column) => column);
}

class $$PinImageEntityTableTableManager extends RootTableManager<
    _$Database,
    $PinImageEntityTable,
    PinImageEntityData,
    $$PinImageEntityTableFilterComposer,
    $$PinImageEntityTableOrderingComposer,
    $$PinImageEntityTableAnnotationComposer,
    $$PinImageEntityTableCreateCompanionBuilder,
    $$PinImageEntityTableUpdateCompanionBuilder,
    (
      PinImageEntityData,
      BaseReferences<_$Database, $PinImageEntityTable, PinImageEntityData>
    ),
    PinImageEntityData,
    PrefetchHooks Function()> {
  $$PinImageEntityTableTableManager(_$Database db, $PinImageEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PinImageEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PinImageEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PinImageEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<Uint8List> image = const Value.absent(),
            Value<String> pinId = const Value.absent(),
            Value<int> hitCount = const Value.absent(),
            Value<DateTime> lastAccessed = const Value.absent(),
            Value<bool> keepAlive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinImageEntityCompanion(
            image: image,
            pinId: pinId,
            hitCount: hitCount,
            lastAccessed: lastAccessed,
            keepAlive: keepAlive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required Uint8List image,
            required String pinId,
            Value<int> hitCount = const Value.absent(),
            Value<DateTime> lastAccessed = const Value.absent(),
            Value<bool> keepAlive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PinImageEntityCompanion.insert(
            image: image,
            pinId: pinId,
            hitCount: hitCount,
            lastAccessed: lastAccessed,
            keepAlive: keepAlive,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PinImageEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $PinImageEntityTable,
    PinImageEntityData,
    $$PinImageEntityTableFilterComposer,
    $$PinImageEntityTableOrderingComposer,
    $$PinImageEntityTableAnnotationComposer,
    $$PinImageEntityTableCreateCompanionBuilder,
    $$PinImageEntityTableUpdateCompanionBuilder,
    (
      PinImageEntityData,
      BaseReferences<_$Database, $PinImageEntityTable, PinImageEntityData>
    ),
    PinImageEntityData,
    PrefetchHooks Function()>;
typedef $$GroupImageEntityTableCreateCompanionBuilder
    = GroupImageEntityCompanion Function({
  required Uint8List profileImage,
  required Uint8List profileImageSmall,
  required Uint8List pinImage,
  required String groupId,
  Value<int> rowid,
});
typedef $$GroupImageEntityTableUpdateCompanionBuilder
    = GroupImageEntityCompanion Function({
  Value<Uint8List> profileImage,
  Value<Uint8List> profileImageSmall,
  Value<Uint8List> pinImage,
  Value<String> groupId,
  Value<int> rowid,
});

class $$GroupImageEntityTableFilterComposer
    extends Composer<_$Database, $GroupImageEntityTable> {
  $$GroupImageEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<Uint8List> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get profileImageSmall => $composableBuilder(
      column: $table.profileImageSmall,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get pinImage => $composableBuilder(
      column: $table.pinImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));
}

class $$GroupImageEntityTableOrderingComposer
    extends Composer<_$Database, $GroupImageEntityTable> {
  $$GroupImageEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<Uint8List> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get profileImageSmall => $composableBuilder(
      column: $table.profileImageSmall,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get pinImage => $composableBuilder(
      column: $table.pinImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));
}

class $$GroupImageEntityTableAnnotationComposer
    extends Composer<_$Database, $GroupImageEntityTable> {
  $$GroupImageEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<Uint8List> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);

  GeneratedColumn<Uint8List> get profileImageSmall => $composableBuilder(
      column: $table.profileImageSmall, builder: (column) => column);

  GeneratedColumn<Uint8List> get pinImage =>
      $composableBuilder(column: $table.pinImage, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);
}

class $$GroupImageEntityTableTableManager extends RootTableManager<
    _$Database,
    $GroupImageEntityTable,
    GroupImageEntityData,
    $$GroupImageEntityTableFilterComposer,
    $$GroupImageEntityTableOrderingComposer,
    $$GroupImageEntityTableAnnotationComposer,
    $$GroupImageEntityTableCreateCompanionBuilder,
    $$GroupImageEntityTableUpdateCompanionBuilder,
    (
      GroupImageEntityData,
      BaseReferences<_$Database, $GroupImageEntityTable, GroupImageEntityData>
    ),
    GroupImageEntityData,
    PrefetchHooks Function()> {
  $$GroupImageEntityTableTableManager(
      _$Database db, $GroupImageEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupImageEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupImageEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupImageEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<Uint8List> profileImage = const Value.absent(),
            Value<Uint8List> profileImageSmall = const Value.absent(),
            Value<Uint8List> pinImage = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupImageEntityCompanion(
            profileImage: profileImage,
            profileImageSmall: profileImageSmall,
            pinImage: pinImage,
            groupId: groupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required Uint8List profileImage,
            required Uint8List profileImageSmall,
            required Uint8List pinImage,
            required String groupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupImageEntityCompanion.insert(
            profileImage: profileImage,
            profileImageSmall: profileImageSmall,
            pinImage: pinImage,
            groupId: groupId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupImageEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GroupImageEntityTable,
    GroupImageEntityData,
    $$GroupImageEntityTableFilterComposer,
    $$GroupImageEntityTableOrderingComposer,
    $$GroupImageEntityTableAnnotationComposer,
    $$GroupImageEntityTableCreateCompanionBuilder,
    $$GroupImageEntityTableUpdateCompanionBuilder,
    (
      GroupImageEntityData,
      BaseReferences<_$Database, $GroupImageEntityTable, GroupImageEntityData>
    ),
    GroupImageEntityData,
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
  $$PinImageEntityTableTableManager get pinImageEntity =>
      $$PinImageEntityTableTableManager(_db, _db.pinImageEntity);
  $$GroupImageEntityTableTableManager get groupImageEntity =>
      $$GroupImageEntityTableTableManager(_db, _db.groupImageEntity);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = ProviderRef<Database>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
