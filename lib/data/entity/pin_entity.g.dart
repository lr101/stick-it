// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPinEntityCollection on Isar {
  IsarCollection<PinEntity> get pinEntitys => this.collection();
}

const PinEntitySchema = CollectionSchema(
  name: r'PinEntity',
  id: 3528796497663360496,
  properties: {
    r'creationDate': PropertySchema(
      id: 0,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'creator': PropertySchema(id: 1, name: r'creator', type: IsarType.string),
    r'creatorFastId': PropertySchema(
      id: 2,
      name: r'creatorFastId',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'groupFastId': PropertySchema(
      id: 4,
      name: r'groupFastId',
      type: IsarType.long,
    ),
    r'groupId': PropertySchema(id: 5, name: r'groupId', type: IsarType.string),
    r'hits': PropertySchema(id: 6, name: r'hits', type: IsarType.long),
    r'isHidden': PropertySchema(id: 7, name: r'isHidden', type: IsarType.bool),
    r'keepAlive': PropertySchema(
      id: 8,
      name: r'keepAlive',
      type: IsarType.bool,
    ),
    r'lastSynced': PropertySchema(
      id: 9,
      name: r'lastSynced',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 10,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 11,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'onlySession': PropertySchema(
      id: 12,
      name: r'onlySession',
      type: IsarType.bool,
    ),
    r'pinId': PropertySchema(id: 13, name: r'pinId', type: IsarType.string),
    r'ttl': PropertySchema(id: 14, name: r'ttl', type: IsarType.dateTime),
  },

  estimateSize: _pinEntityEstimateSize,
  serialize: _pinEntitySerialize,
  deserialize: _pinEntityDeserialize,
  deserializeProp: _pinEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'creatorFastId': IndexSchema(
      id: -7073158676165006645,
      name: r'creatorFastId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'creatorFastId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'groupFastId': IndexSchema(
      id: 7992203896356511312,
      name: r'groupFastId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'groupFastId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _pinEntityGetId,
  getLinks: _pinEntityGetLinks,
  attach: _pinEntityAttach,
  version: '3.3.0-dev.1',
);

int _pinEntityEstimateSize(
  PinEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.creator.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.groupId.length * 3;
  bytesCount += 3 + object.pinId.length * 3;
  return bytesCount;
}

void _pinEntitySerialize(
  PinEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.creationDate);
  writer.writeString(offsets[1], object.creator);
  writer.writeLong(offsets[2], object.creatorFastId);
  writer.writeString(offsets[3], object.description);
  writer.writeLong(offsets[4], object.groupFastId);
  writer.writeString(offsets[5], object.groupId);
  writer.writeLong(offsets[6], object.hits);
  writer.writeBool(offsets[7], object.isHidden);
  writer.writeBool(offsets[8], object.keepAlive);
  writer.writeDateTime(offsets[9], object.lastSynced);
  writer.writeDouble(offsets[10], object.latitude);
  writer.writeDouble(offsets[11], object.longitude);
  writer.writeBool(offsets[12], object.onlySession);
  writer.writeString(offsets[13], object.pinId);
  writer.writeDateTime(offsets[14], object.ttl);
}

PinEntity _pinEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PinEntity(
    creationDate: reader.readDateTime(offsets[0]),
    creator: reader.readString(offsets[1]),
    description: reader.readStringOrNull(offsets[3]),
    groupId: reader.readString(offsets[5]),
    hits: reader.readLongOrNull(offsets[6]) ?? 1,
    isHidden: reader.readBoolOrNull(offsets[7]) ?? false,
    keepAlive: reader.readBoolOrNull(offsets[8]) ?? false,
    lastSynced: reader.readDateTimeOrNull(offsets[9]),
    latitude: reader.readDouble(offsets[10]),
    longitude: reader.readDouble(offsets[11]),
    onlySession: reader.readBool(offsets[12]),
    pinId: reader.readString(offsets[13]),
    ttl: reader.readDateTime(offsets[14]),
  );
  return object;
}

P _pinEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pinEntityGetId(PinEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _pinEntityGetLinks(PinEntity object) {
  return [];
}

void _pinEntityAttach(IsarCollection<dynamic> col, Id id, PinEntity object) {}

extension PinEntityQueryWhereSort
    on QueryBuilder<PinEntity, PinEntity, QWhere> {
  QueryBuilder<PinEntity, PinEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhere> anyCreatorFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'creatorFastId'),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhere> anyGroupFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'groupFastId'),
      );
    });
  }
}

extension PinEntityQueryWhere
    on QueryBuilder<PinEntity, PinEntity, QWhereClause> {
  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> creatorFastIdEqualTo(
    int creatorFastId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'creatorFastId',
          value: [creatorFastId],
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> creatorFastIdNotEqualTo(
    int creatorFastId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'creatorFastId',
                lower: [],
                upper: [creatorFastId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'creatorFastId',
                lower: [creatorFastId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'creatorFastId',
                lower: [creatorFastId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'creatorFastId',
                lower: [],
                upper: [creatorFastId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause>
  creatorFastIdGreaterThan(int creatorFastId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'creatorFastId',
          lower: [creatorFastId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> creatorFastIdLessThan(
    int creatorFastId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'creatorFastId',
          lower: [],
          upper: [creatorFastId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> creatorFastIdBetween(
    int lowerCreatorFastId,
    int upperCreatorFastId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'creatorFastId',
          lower: [lowerCreatorFastId],
          includeLower: includeLower,
          upper: [upperCreatorFastId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> groupFastIdEqualTo(
    int groupFastId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'groupFastId',
          value: [groupFastId],
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> groupFastIdNotEqualTo(
    int groupFastId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupFastId',
                lower: [],
                upper: [groupFastId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupFastId',
                lower: [groupFastId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupFastId',
                lower: [groupFastId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupFastId',
                lower: [],
                upper: [groupFastId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> groupFastIdGreaterThan(
    int groupFastId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupFastId',
          lower: [groupFastId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> groupFastIdLessThan(
    int groupFastId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupFastId',
          lower: [],
          upper: [groupFastId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterWhereClause> groupFastIdBetween(
    int lowerGroupFastId,
    int upperGroupFastId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupFastId',
          lower: [lowerGroupFastId],
          includeLower: includeLower,
          upper: [upperGroupFastId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PinEntityQueryFilter
    on QueryBuilder<PinEntity, PinEntity, QFilterCondition> {
  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creationDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creationDate', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creationDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'creationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creationDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'creationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'creationDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'creator',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'creator',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'creator',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> creatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creator', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'creator', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creatorFastIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creatorFastId', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creatorFastIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'creatorFastId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creatorFastIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'creatorFastId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  creatorFastIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'creatorFastId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> descriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupFastIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupFastId', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  groupFastIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupFastId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupFastIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupFastId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupFastIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupFastId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdEqualTo(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdGreaterThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdLessThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdBetween(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdEndsWith(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdContains(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdMatches(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'groupId', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> hitsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hits', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> hitsGreaterThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> hitsLessThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> hitsBetween(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> isHiddenEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isHidden', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> keepAliveEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'keepAlive', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> lastSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSynced'),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  lastSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSynced'),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> lastSyncedEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSynced', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  lastSyncedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSynced',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> lastSyncedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSynced',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> lastSyncedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSynced',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition>
  longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'longitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> onlySessionEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onlySession', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pinId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pinId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pinId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pinId', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> pinIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pinId', value: ''),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> ttlEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> ttlGreaterThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> ttlLessThan(
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

  QueryBuilder<PinEntity, PinEntity, QAfterFilterCondition> ttlBetween(
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

extension PinEntityQueryObject
    on QueryBuilder<PinEntity, PinEntity, QFilterCondition> {}

extension PinEntityQueryLinks
    on QueryBuilder<PinEntity, PinEntity, QFilterCondition> {}

extension PinEntityQuerySortBy on QueryBuilder<PinEntity, PinEntity, QSortBy> {
  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreatorFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatorFastId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByCreatorFastIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatorFastId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByGroupFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupFastId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByGroupFastIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupFastId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByIsHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHidden', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByIsHiddenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHidden', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByPinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByPinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension PinEntityQuerySortThenBy
    on QueryBuilder<PinEntity, PinEntity, QSortThenBy> {
  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreatorFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatorFastId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByCreatorFastIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatorFastId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByGroupFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupFastId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByGroupFastIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupFastId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByIsHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHidden', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByIsHiddenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHidden', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByKeepAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepAlive', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByOnlySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlySession', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByPinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinId', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByPinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinId', Sort.desc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension PinEntityQueryWhereDistinct
    on QueryBuilder<PinEntity, PinEntity, QDistinct> {
  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByCreator({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByCreatorFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creatorFastId');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByGroupFastId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupFastId');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByGroupId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByIsHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHidden');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByKeepAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepAlive');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSynced');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByOnlySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlySession');
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByPinId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PinEntity, PinEntity, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }
}

extension PinEntityQueryProperty
    on QueryBuilder<PinEntity, PinEntity, QQueryProperty> {
  QueryBuilder<PinEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PinEntity, DateTime, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<PinEntity, String, QQueryOperations> creatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creator');
    });
  }

  QueryBuilder<PinEntity, int, QQueryOperations> creatorFastIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creatorFastId');
    });
  }

  QueryBuilder<PinEntity, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<PinEntity, int, QQueryOperations> groupFastIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupFastId');
    });
  }

  QueryBuilder<PinEntity, String, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<PinEntity, int, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<PinEntity, bool, QQueryOperations> isHiddenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHidden');
    });
  }

  QueryBuilder<PinEntity, bool, QQueryOperations> keepAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepAlive');
    });
  }

  QueryBuilder<PinEntity, DateTime?, QQueryOperations> lastSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSynced');
    });
  }

  QueryBuilder<PinEntity, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<PinEntity, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<PinEntity, bool, QQueryOperations> onlySessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlySession');
    });
  }

  QueryBuilder<PinEntity, String, QQueryOperations> pinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinId');
    });
  }

  QueryBuilder<PinEntity, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }
}
