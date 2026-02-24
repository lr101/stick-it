// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SeasonEntitySchema = Schema(
  name: r'SeasonEntity',
  id: -5455682246118402594,
  properties: {
    r'month': PropertySchema(id: 0, name: r'month', type: IsarType.long),
    r'points': PropertySchema(id: 1, name: r'points', type: IsarType.long),
    r'rank': PropertySchema(id: 2, name: r'rank', type: IsarType.long),
    r'seasonId': PropertySchema(
      id: 3,
      name: r'seasonId',
      type: IsarType.string,
    ),
    r'seasonNumber': PropertySchema(
      id: 4,
      name: r'seasonNumber',
      type: IsarType.long,
    ),
    r'year': PropertySchema(id: 5, name: r'year', type: IsarType.long),
  },

  estimateSize: _seasonEntityEstimateSize,
  serialize: _seasonEntitySerialize,
  deserialize: _seasonEntityDeserialize,
  deserializeProp: _seasonEntityDeserializeProp,
);

int _seasonEntityEstimateSize(
  SeasonEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.seasonId.length * 3;
  return bytesCount;
}

void _seasonEntitySerialize(
  SeasonEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.month);
  writer.writeLong(offsets[1], object.points);
  writer.writeLong(offsets[2], object.rank);
  writer.writeString(offsets[3], object.seasonId);
  writer.writeLong(offsets[4], object.seasonNumber);
  writer.writeLong(offsets[5], object.year);
}

SeasonEntity _seasonEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SeasonEntity(
    month: reader.readLongOrNull(offsets[0]) ?? 0,
    points: reader.readLongOrNull(offsets[1]) ?? 0,
    rank: reader.readLongOrNull(offsets[2]) ?? 0,
    seasonId: reader.readStringOrNull(offsets[3]) ?? "",
    seasonNumber: reader.readLongOrNull(offsets[4]) ?? 0,
    year: reader.readLongOrNull(offsets[5]) ?? 0,
  );
  return object;
}

P _seasonEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SeasonEntityQueryFilter
    on QueryBuilder<SeasonEntity, SeasonEntity, QFilterCondition> {
  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> monthEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'month', value: value),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  monthGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'month',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'month',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'month',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> pointsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'points', value: value),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  pointsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'points',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  pointsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'points',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> pointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'points',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> rankEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rank', value: value),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  rankGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'seasonId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'seasonId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'seasonId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'seasonId', value: ''),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'seasonId', value: ''),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'seasonNumber', value: value),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonNumberGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'seasonNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonNumberLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'seasonNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  seasonNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'seasonNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> yearEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'year', value: value),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition>
  yearGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SeasonEntity, SeasonEntity, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'year',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SeasonEntityQueryObject
    on QueryBuilder<SeasonEntity, SeasonEntity, QFilterCondition> {}
