// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pins_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserPinsEntityCollection on Isar {
  IsarCollection<UserPinsEntity> get userPinsEntitys => this.collection();
}

const UserPinsEntitySchema = CollectionSchema(
  name: r'UserPinsEntity',
  id: 8736116908018778,
  properties: {
    r'hits': PropertySchema(id: 0, name: r'hits', type: IsarType.long),
    r'keepAlive': PropertySchema(
      id: 1,
      name: r'keepAlive',
      type: IsarType.bool,
    ),
    r'onlySession': PropertySchema(
      id: 2,
      name: r'onlySession',
      type: IsarType.bool,
    ),
    r'pins': PropertySchema(id: 3, name: r'pins', type: IsarType.stringList),
    r'ttl': PropertySchema(id: 4, name: r'ttl', type: IsarType.dateTime),
    r'userId': PropertySchema(id: 5, name: r'userId', type: IsarType.string),
  },

  estimateSize: _userPinsEntityEstimateSize,
  serialize: _userPinsEntitySerialize,
  deserialize: _userPinsEntityDeserialize,
  deserializeProp: _userPinsEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _userPinsEntityGetId,
  getLinks: _userPinsEntityGetLinks,
  attach: _userPinsEntityAttach,
  version: '3.3.0-dev.1',
);

int _userPinsEntityEstimateSize(
  UserPinsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pins.length * 3;
  {
    for (var i = 0; i < object.pins.length; i++) {
      final value = object.pins[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _userPinsEntitySerialize(
  UserPinsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hits);
  writer.writeBool(offsets[1], object.keepAlive);
  writer.writeBool(offsets[2], object.onlySession);
  writer.writeStringList(offsets[3], object.pins);
  writer.writeDateTime(offsets[4], object.ttl);
  writer.writeString(offsets[5], object.userId);
}

UserPinsEntity _userPinsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPinsEntity(
    hits: reader.readLongOrNull(offsets[0]) ?? 1,
    keepAlive: reader.readBoolOrNull(offsets[1]) ?? false,
    onlySession: reader.readBool(offsets[2]),
    pins: reader.readStringList(offsets[3]) ?? [],
    ttl: reader.readDateTime(offsets[4]),
    userId: reader.readString(offsets[5]),
  );
  return object;
}

P _userPinsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userPinsEntityGetId(UserPinsEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _userPinsEntityGetLinks(UserPinsEntity object) {
  return [];
}

void _userPinsEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserPinsEntity object,
) {}

extension UserPinsEntityQueryWhereSort
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QWhere> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserPinsEntityQueryWhere
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QWhereClause> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhereClause>
  isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterWhereClause> isarIdBetween(
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

extension UserPinsEntityQueryFilter
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QFilterCondition> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  hitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hits', value: value),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  hitsGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  hitsLessThan(int value, {bool include = false}) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  hitsBetween(
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  isarIdLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  isarIdBetween(
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  keepAliveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'keepAlive', value: value),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  onlySessionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onlySession', value: value),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pins',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pins',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pins',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pins', value: ''),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pins', value: ''),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pins', length, true, length, true);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pins', 0, true, 0, true);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pins', 0, false, 999999, true);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pins', 0, true, length, include);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pins', length, include, 999999, true);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  pinsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pins',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  ttlEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  ttlGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  ttlLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  ttlBetween(
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

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension UserPinsEntityQueryObject
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QFilterCondition> {}

extension UserPinsEntityQueryLinks
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QFilterCondition> {}

extension UserPinsEntityQuerySortBy
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QSortBy> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  sortByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  sortByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  sortByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserPinsEntityQuerySortThenBy
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QSortThenBy> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  thenByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  thenByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  thenByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserPinsEntityQueryWhereDistinct
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct> {
  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct>
  distinctByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepAlive');
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct>
  distinctByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlySession');
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct> distinctByPins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pins');
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }

  QueryBuilder<UserPinsEntity, UserPinsEntity, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserPinsEntityQueryProperty
    on QueryBuilder<UserPinsEntity, UserPinsEntity, QQueryProperty> {
  QueryBuilder<UserPinsEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<UserPinsEntity, int, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<UserPinsEntity, bool, QQueryOperations> keepAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepAlive');
    });
  }

  QueryBuilder<UserPinsEntity, bool, QQueryOperations> onlySessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlySession');
    });
  }

  QueryBuilder<UserPinsEntity, List<String>, QQueryOperations> pinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pins');
    });
  }

  QueryBuilder<UserPinsEntity, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }

  QueryBuilder<UserPinsEntity, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
