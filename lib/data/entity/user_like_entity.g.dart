// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_like_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserLikeEntityCollection on Isar {
  IsarCollection<UserLikeEntity> get userLikeEntitys => this.collection();
}

const UserLikeEntitySchema = CollectionSchema(
  name: r'UserLikeEntity',
  id: -5293057070121516863,
  properties: {
    r'hits': PropertySchema(id: 0, name: r'hits', type: IsarType.long),
    r'keepAlive': PropertySchema(
      id: 1,
      name: r'keepAlive',
      type: IsarType.bool,
    ),
    r'likeArtCount': PropertySchema(
      id: 2,
      name: r'likeArtCount',
      type: IsarType.long,
    ),
    r'likeCount': PropertySchema(
      id: 3,
      name: r'likeCount',
      type: IsarType.long,
    ),
    r'likeLocationCount': PropertySchema(
      id: 4,
      name: r'likeLocationCount',
      type: IsarType.long,
    ),
    r'likePhotographyCount': PropertySchema(
      id: 5,
      name: r'likePhotographyCount',
      type: IsarType.long,
    ),
    r'onlySession': PropertySchema(
      id: 6,
      name: r'onlySession',
      type: IsarType.bool,
    ),
    r'ttl': PropertySchema(id: 7, name: r'ttl', type: IsarType.dateTime),
    r'userId': PropertySchema(id: 8, name: r'userId', type: IsarType.string),
  },

  estimateSize: _userLikeEntityEstimateSize,
  serialize: _userLikeEntitySerialize,
  deserialize: _userLikeEntityDeserialize,
  deserializeProp: _userLikeEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _userLikeEntityGetId,
  getLinks: _userLikeEntityGetLinks,
  attach: _userLikeEntityAttach,
  version: '3.3.0',
);

int _userLikeEntityEstimateSize(
  UserLikeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _userLikeEntitySerialize(
  UserLikeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hits);
  writer.writeBool(offsets[1], object.keepAlive);
  writer.writeLong(offsets[2], object.likeArtCount);
  writer.writeLong(offsets[3], object.likeCount);
  writer.writeLong(offsets[4], object.likeLocationCount);
  writer.writeLong(offsets[5], object.likePhotographyCount);
  writer.writeBool(offsets[6], object.onlySession);
  writer.writeDateTime(offsets[7], object.ttl);
  writer.writeString(offsets[8], object.userId);
}

UserLikeEntity _userLikeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserLikeEntity(
    hits: reader.readLongOrNull(offsets[0]) ?? 1,
    likeArtCount: reader.readLong(offsets[2]),
    likeCount: reader.readLong(offsets[3]),
    likeLocationCount: reader.readLong(offsets[4]),
    likePhotographyCount: reader.readLong(offsets[5]),
    onlySession: reader.readBool(offsets[6]),
    ttl: reader.readDateTime(offsets[7]),
    userId: reader.readString(offsets[8]),
  );
  return object;
}

P _userLikeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userLikeEntityGetId(UserLikeEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _userLikeEntityGetLinks(UserLikeEntity object) {
  return [];
}

void _userLikeEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserLikeEntity object,
) {}

extension UserLikeEntityQueryWhereSort
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QWhere> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserLikeEntityQueryWhere
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QWhereClause> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhereClause>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterWhereClause> isarIdBetween(
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

extension UserLikeEntityQueryFilter
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QFilterCondition> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  hitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hits', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  keepAliveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'keepAlive', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeArtCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeArtCount', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeArtCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'likeArtCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeArtCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'likeArtCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeArtCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'likeArtCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeCount', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'likeCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'likeCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'likeCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeLocationCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeLocationCount', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeLocationCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'likeLocationCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeLocationCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'likeLocationCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likeLocationCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'likeLocationCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likePhotographyCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'likePhotographyCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likePhotographyCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'likePhotographyCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likePhotographyCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'likePhotographyCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  likePhotographyCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'likePhotographyCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  onlySessionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onlySession', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  ttlEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension UserLikeEntityQueryObject
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QFilterCondition> {}

extension UserLikeEntityQueryLinks
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QFilterCondition> {}

extension UserLikeEntityQuerySortBy
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QSortBy> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikeArtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikeLocationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByLikePhotographyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserLikeEntityQuerySortThenBy
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QSortThenBy> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikeArtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikeLocationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByLikePhotographyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserLikeEntityQueryWhereDistinct
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct> {
  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepAlive');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeArtCount');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeCount');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeLocationCount');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likePhotographyCount');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct>
  distinctByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlySession');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }

  QueryBuilder<UserLikeEntity, UserLikeEntity, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserLikeEntityQueryProperty
    on QueryBuilder<UserLikeEntity, UserLikeEntity, QQueryProperty> {
  QueryBuilder<UserLikeEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<UserLikeEntity, int, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<UserLikeEntity, bool, QQueryOperations> keepAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepAlive');
    });
  }

  QueryBuilder<UserLikeEntity, int, QQueryOperations> likeArtCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeArtCount');
    });
  }

  QueryBuilder<UserLikeEntity, int, QQueryOperations> likeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeCount');
    });
  }

  QueryBuilder<UserLikeEntity, int, QQueryOperations>
  likeLocationCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeLocationCount');
    });
  }

  QueryBuilder<UserLikeEntity, int, QQueryOperations>
  likePhotographyCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likePhotographyCount');
    });
  }

  QueryBuilder<UserLikeEntity, bool, QQueryOperations> onlySessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlySession');
    });
  }

  QueryBuilder<UserLikeEntity, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }

  QueryBuilder<UserLikeEntity, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
