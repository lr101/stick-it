// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_like_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPinLikeEntityCollection on Isar {
  IsarCollection<PinLikeEntity> get pinLikeEntitys => this.collection();
}

const PinLikeEntitySchema = CollectionSchema(
  name: r'PinLikeEntity',
  id: 1679042970606838489,
  properties: {
    r'hasLike': PropertySchema(id: 0, name: r'hasLike', type: IsarType.bool),
    r'hasLikeArt': PropertySchema(
      id: 1,
      name: r'hasLikeArt',
      type: IsarType.bool,
    ),
    r'hasLikeLocation': PropertySchema(
      id: 2,
      name: r'hasLikeLocation',
      type: IsarType.bool,
    ),
    r'hasLikePhotography': PropertySchema(
      id: 3,
      name: r'hasLikePhotography',
      type: IsarType.bool,
    ),
    r'hits': PropertySchema(id: 4, name: r'hits', type: IsarType.long),
    r'id': PropertySchema(id: 5, name: r'id', type: IsarType.string),
    r'keepAlive': PropertySchema(
      id: 6,
      name: r'keepAlive',
      type: IsarType.bool,
    ),
    r'likeArtCount': PropertySchema(
      id: 7,
      name: r'likeArtCount',
      type: IsarType.long,
    ),
    r'likeCount': PropertySchema(
      id: 8,
      name: r'likeCount',
      type: IsarType.long,
    ),
    r'likeLocationCount': PropertySchema(
      id: 9,
      name: r'likeLocationCount',
      type: IsarType.long,
    ),
    r'likePhotographyCount': PropertySchema(
      id: 10,
      name: r'likePhotographyCount',
      type: IsarType.long,
    ),
    r'onlySession': PropertySchema(
      id: 11,
      name: r'onlySession',
      type: IsarType.bool,
    ),
    r'ttl': PropertySchema(id: 12, name: r'ttl', type: IsarType.dateTime),
  },

  estimateSize: _pinLikeEntityEstimateSize,
  serialize: _pinLikeEntitySerialize,
  deserialize: _pinLikeEntityDeserialize,
  deserializeProp: _pinLikeEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _pinLikeEntityGetId,
  getLinks: _pinLikeEntityGetLinks,
  attach: _pinLikeEntityAttach,
  version: '3.3.0-dev.1',
);

int _pinLikeEntityEstimateSize(
  PinLikeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  return bytesCount;
}

void _pinLikeEntitySerialize(
  PinLikeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.hasLike);
  writer.writeBool(offsets[1], object.hasLikeArt);
  writer.writeBool(offsets[2], object.hasLikeLocation);
  writer.writeBool(offsets[3], object.hasLikePhotography);
  writer.writeLong(offsets[4], object.hits);
  writer.writeString(offsets[5], object.id);
  writer.writeBool(offsets[6], object.keepAlive);
  writer.writeLong(offsets[7], object.likeArtCount);
  writer.writeLong(offsets[8], object.likeCount);
  writer.writeLong(offsets[9], object.likeLocationCount);
  writer.writeLong(offsets[10], object.likePhotographyCount);
  writer.writeBool(offsets[11], object.onlySession);
  writer.writeDateTime(offsets[12], object.ttl);
}

PinLikeEntity _pinLikeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PinLikeEntity(
    hasLike: reader.readBool(offsets[0]),
    hasLikeArt: reader.readBool(offsets[1]),
    hasLikeLocation: reader.readBool(offsets[2]),
    hasLikePhotography: reader.readBool(offsets[3]),
    hits: reader.readLongOrNull(offsets[4]) ?? 1,
    id: reader.readString(offsets[5]),
    likeArtCount: reader.readLong(offsets[7]),
    likeCount: reader.readLong(offsets[8]),
    likeLocationCount: reader.readLong(offsets[9]),
    likePhotographyCount: reader.readLong(offsets[10]),
    onlySession: reader.readBoolOrNull(offsets[11]) ?? true,
    ttl: reader.readDateTime(offsets[12]),
  );
  return object;
}

P _pinLikeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pinLikeEntityGetId(PinLikeEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _pinLikeEntityGetLinks(PinLikeEntity object) {
  return [];
}

void _pinLikeEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  PinLikeEntity object,
) {}

extension PinLikeEntityQueryWhereSort
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QWhere> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PinLikeEntityQueryWhere
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QWhereClause> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhereClause>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterWhereClause> isarIdBetween(
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

extension PinLikeEntityQueryFilter
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QFilterCondition> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  hasLikeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasLike', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  hasLikeArtEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasLikeArt', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  hasLikeLocationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasLikeLocation', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  hasLikePhotographyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasLikePhotography', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> hitsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hits', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> hitsBetween(
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  idStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> idMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'id',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: ''),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'id', value: ''),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  keepAliveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'keepAlive', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  likeArtCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeArtCount', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  likeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeCount', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  likeLocationCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'likeLocationCount', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
  onlySessionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onlySession', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> ttlEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition>
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> ttlLessThan(
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

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterFilterCondition> ttlBetween(
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
}

extension PinLikeEntityQueryObject
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QFilterCondition> {}

extension PinLikeEntityQueryLinks
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QFilterCondition> {}

extension PinLikeEntityQuerySortBy
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QSortBy> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByHasLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLike', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByHasLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLike', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByHasLikeArt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeArt', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByHasLikeArtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeArt', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByHasLikeLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeLocation', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByHasLikeLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeLocation', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByHasLikePhotography() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikePhotography', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByHasLikePhotographyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikePhotography', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikeArtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikeLocationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByLikePhotographyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  sortByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension PinLikeEntityQuerySortThenBy
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QSortThenBy> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByHasLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLike', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByHasLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLike', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByHasLikeArt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeArt', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByHasLikeArtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeArt', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByHasLikeLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeLocation', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByHasLikeLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikeLocation', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByHasLikePhotography() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikePhotography', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByHasLikePhotographyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasLikePhotography', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikeArtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeArtCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikeLocationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeLocationCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByLikePhotographyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likePhotographyCount', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy>
  thenByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension PinLikeEntityQueryWhereDistinct
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> {
  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByHasLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasLike');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByHasLikeArt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasLikeArt');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByHasLikeLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasLikeLocation');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByHasLikePhotography() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasLikePhotography');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctById({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepAlive');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByLikeArtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeArtCount');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeCount');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByLikeLocationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeLocationCount');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByLikePhotographyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likePhotographyCount');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct>
  distinctByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlySession');
    });
  }

  QueryBuilder<PinLikeEntity, PinLikeEntity, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }
}

extension PinLikeEntityQueryProperty
    on QueryBuilder<PinLikeEntity, PinLikeEntity, QQueryProperty> {
  QueryBuilder<PinLikeEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations> hasLikeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasLike');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations> hasLikeArtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasLikeArt');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations>
  hasLikeLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasLikeLocation');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations>
  hasLikePhotographyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasLikePhotography');
    });
  }

  QueryBuilder<PinLikeEntity, int, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<PinLikeEntity, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations> keepAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepAlive');
    });
  }

  QueryBuilder<PinLikeEntity, int, QQueryOperations> likeArtCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeArtCount');
    });
  }

  QueryBuilder<PinLikeEntity, int, QQueryOperations> likeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeCount');
    });
  }

  QueryBuilder<PinLikeEntity, int, QQueryOperations>
  likeLocationCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeLocationCount');
    });
  }

  QueryBuilder<PinLikeEntity, int, QQueryOperations>
  likePhotographyCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likePhotographyCount');
    });
  }

  QueryBuilder<PinLikeEntity, bool, QQueryOperations> onlySessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlySession');
    });
  }

  QueryBuilder<PinLikeEntity, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }
}
