// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroupEntityCollection on Isar {
  IsarCollection<GroupEntity> get groupEntitys => this.collection();
}

const GroupEntitySchema = CollectionSchema(
  name: r'GroupEntity',
  id: -2259619910335975057,
  properties: {
    r'bestSeason': PropertySchema(
      id: 0,
      name: r'bestSeason',
      type: IsarType.object,

      target: r'SeasonEntity',
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'groupAdmin': PropertySchema(
      id: 2,
      name: r'groupAdmin',
      type: IsarType.string,
    ),
    r'groupId': PropertySchema(id: 3, name: r'groupId', type: IsarType.string),
    r'hits': PropertySchema(id: 4, name: r'hits', type: IsarType.long),
    r'inviteUrl': PropertySchema(
      id: 5,
      name: r'inviteUrl',
      type: IsarType.string,
    ),
    r'isActivated': PropertySchema(
      id: 6,
      name: r'isActivated',
      type: IsarType.bool,
    ),
    r'keepAlive': PropertySchema(
      id: 7,
      name: r'keepAlive',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 8,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'link': PropertySchema(id: 9, name: r'link', type: IsarType.string),
    r'name': PropertySchema(id: 10, name: r'name', type: IsarType.string),
    r'onlySession': PropertySchema(
      id: 11,
      name: r'onlySession',
      type: IsarType.bool,
    ),
    r'ttl': PropertySchema(id: 12, name: r'ttl', type: IsarType.dateTime),
    r'userIsMember': PropertySchema(
      id: 13,
      name: r'userIsMember',
      type: IsarType.bool,
    ),
    r'visibility': PropertySchema(
      id: 14,
      name: r'visibility',
      type: IsarType.long,
    ),
  },

  estimateSize: _groupEntityEstimateSize,
  serialize: _groupEntitySerialize,
  deserialize: _groupEntityDeserialize,
  deserializeProp: _groupEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SeasonEntity': SeasonEntitySchema},

  getId: _groupEntityGetId,
  getLinks: _groupEntityGetLinks,
  attach: _groupEntityAttach,
  version: '3.3.0',
);

int _groupEntityEstimateSize(
  GroupEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bestSeason;
    if (value != null) {
      bytesCount +=
          3 +
          SeasonEntitySchema.estimateSize(
            value,
            allOffsets[SeasonEntity]!,
            allOffsets,
          );
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupAdmin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.groupId.length * 3;
  {
    final value = object.inviteUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.link;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _groupEntitySerialize(
  GroupEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<SeasonEntity>(
    offsets[0],
    allOffsets,
    SeasonEntitySchema.serialize,
    object.bestSeason,
  );
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.groupAdmin);
  writer.writeString(offsets[3], object.groupId);
  writer.writeLong(offsets[4], object.hits);
  writer.writeString(offsets[5], object.inviteUrl);
  writer.writeBool(offsets[6], object.isActivated);
  writer.writeBool(offsets[7], object.keepAlive);
  writer.writeDateTime(offsets[8], object.lastUpdated);
  writer.writeString(offsets[9], object.link);
  writer.writeString(offsets[10], object.name);
  writer.writeBool(offsets[11], object.onlySession);
  writer.writeDateTime(offsets[12], object.ttl);
  writer.writeBool(offsets[13], object.userIsMember);
  writer.writeLong(offsets[14], object.visibility);
}

GroupEntity _groupEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroupEntity(
    bestSeason: reader.readObjectOrNull<SeasonEntity>(
      offsets[0],
      SeasonEntitySchema.deserialize,
      allOffsets,
    ),
    description: reader.readStringOrNull(offsets[1]),
    groupAdmin: reader.readStringOrNull(offsets[2]),
    groupId: reader.readString(offsets[3]),
    hits: reader.readLongOrNull(offsets[4]) ?? 1,
    inviteUrl: reader.readStringOrNull(offsets[5]),
    isActivated: reader.readBoolOrNull(offsets[6]) ?? false,
    keepAlive: reader.readBoolOrNull(offsets[7]) ?? false,
    lastUpdated: reader.readDateTimeOrNull(offsets[8]),
    link: reader.readStringOrNull(offsets[9]),
    name: reader.readString(offsets[10]),
    onlySession: reader.readBool(offsets[11]),
    ttl: reader.readDateTime(offsets[12]),
    userIsMember: reader.readBool(offsets[13]),
    visibility: reader.readLong(offsets[14]),
  );
  return object;
}

P _groupEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<SeasonEntity>(
            offset,
            SeasonEntitySchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupEntityGetId(GroupEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _groupEntityGetLinks(GroupEntity object) {
  return [];
}

void _groupEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  GroupEntity object,
) {}

extension GroupEntityQueryWhereSort
    on QueryBuilder<GroupEntity, GroupEntity, QWhere> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupEntityQueryWhere
    on QueryBuilder<GroupEntity, GroupEntity, QWhereClause> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterWhereClause> isarIdNotEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension GroupEntityQueryFilter
    on QueryBuilder<GroupEntity, GroupEntity, QFilterCondition> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  bestSeasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bestSeason'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  bestSeasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bestSeason'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'groupAdmin'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'groupAdmin'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupAdmin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'groupAdmin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'groupAdmin',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupAdmin', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupAdminIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'groupAdmin', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'groupId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> groupIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'groupId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'groupId', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> hitsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hits', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> hitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hits',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> hitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hits',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> hitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hits',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'inviteUrl'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'inviteUrl'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'inviteUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'inviteUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'inviteUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'inviteUrl', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  inviteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'inviteUrl', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  isActivatedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActivated', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  keepAliveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'keepAlive', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdated'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdated'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'link'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  linkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'link'),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'link',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'link',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'link', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'link', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  onlySessionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onlySession', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> ttlEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> ttlGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ttl',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> ttlLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ttl',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> ttlBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ttl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  userIsMemberEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userIsMember', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  visibilityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visibility', value: value),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  visibilityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visibility',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  visibilityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visibility',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition>
  visibilityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visibility',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension GroupEntityQueryObject
    on QueryBuilder<GroupEntity, GroupEntity, QFilterCondition> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterFilterCondition> bestSeason(
    FilterQuery<SeasonEntity> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bestSeason');
    });
  }
}

extension GroupEntityQueryLinks
    on QueryBuilder<GroupEntity, GroupEntity, QFilterCondition> {}

extension GroupEntityQuerySortBy
    on QueryBuilder<GroupEntity, GroupEntity, QSortBy> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByGroupAdmin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupAdmin', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByGroupAdminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupAdmin', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByInviteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteUrl', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByInviteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteUrl', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByIsActivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActivated', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByIsActivatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActivated', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByUserIsMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIsMember', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy>
  sortByUserIsMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIsMember', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> sortByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }
}

extension GroupEntityQuerySortThenBy
    on QueryBuilder<GroupEntity, GroupEntity, QSortThenBy> {
  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByGroupAdmin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupAdmin', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByGroupAdminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupAdmin', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByInviteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteUrl', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByInviteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteUrl', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByIsActivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActivated', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByIsActivatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActivated', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByUserIsMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIsMember', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy>
  thenByUserIsMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIsMember', Sort.desc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QAfterSortBy> thenByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }
}

extension GroupEntityQueryWhereDistinct
    on QueryBuilder<GroupEntity, GroupEntity, QDistinct> {
  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByGroupAdmin({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupAdmin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByGroupId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByInviteUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inviteUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByIsActivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActivated');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepAlive');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByLink({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlySession');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByUserIsMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userIsMember');
    });
  }

  QueryBuilder<GroupEntity, GroupEntity, QDistinct> distinctByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility');
    });
  }
}

extension GroupEntityQueryProperty
    on QueryBuilder<GroupEntity, GroupEntity, QQueryProperty> {
  QueryBuilder<GroupEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GroupEntity, SeasonEntity?, QQueryOperations>
  bestSeasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestSeason');
    });
  }

  QueryBuilder<GroupEntity, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<GroupEntity, String?, QQueryOperations> groupAdminProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupAdmin');
    });
  }

  QueryBuilder<GroupEntity, String, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<GroupEntity, int, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<GroupEntity, String?, QQueryOperations> inviteUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inviteUrl');
    });
  }

  QueryBuilder<GroupEntity, bool, QQueryOperations> isActivatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActivated');
    });
  }

  QueryBuilder<GroupEntity, bool, QQueryOperations> keepAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepAlive');
    });
  }

  QueryBuilder<GroupEntity, DateTime?, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<GroupEntity, String?, QQueryOperations> linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }

  QueryBuilder<GroupEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GroupEntity, bool, QQueryOperations> onlySessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlySession');
    });
  }

  QueryBuilder<GroupEntity, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }

  QueryBuilder<GroupEntity, bool, QQueryOperations> userIsMemberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userIsMember');
    });
  }

  QueryBuilder<GroupEntity, int, QQueryOperations> visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }
}
