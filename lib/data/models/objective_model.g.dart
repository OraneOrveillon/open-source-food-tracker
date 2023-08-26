// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetObjectiveCollection on Isar {
  IsarCollection<Objective> get objectives => this.collection();
}

const ObjectiveSchema = CollectionSchema(
  name: r'Objective',
  id: -9021490811043921722,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.int,
    ),
    r'carbohydrates': PropertySchema(
      id: 1,
      name: r'carbohydrates',
      type: IsarType.float,
    ),
    r'creationDate': PropertySchema(
      id: 2,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'lipids': PropertySchema(
      id: 3,
      name: r'lipids',
      type: IsarType.float,
    ),
    r'proteins': PropertySchema(
      id: 4,
      name: r'proteins',
      type: IsarType.float,
    ),
    r'saturatedFats': PropertySchema(
      id: 5,
      name: r'saturatedFats',
      type: IsarType.float,
    ),
    r'sugars': PropertySchema(
      id: 6,
      name: r'sugars',
      type: IsarType.float,
    )
  },
  estimateSize: _objectiveEstimateSize,
  serialize: _objectiveSerialize,
  deserialize: _objectiveDeserialize,
  deserializeProp: _objectiveDeserializeProp,
  idName: r'id',
  indexes: {
    r'creationDate': IndexSchema(
      id: -78501097794997996,
      name: r'creationDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'creationDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _objectiveGetId,
  getLinks: _objectiveGetLinks,
  attach: _objectiveAttach,
  version: '3.1.0+1',
);

int _objectiveEstimateSize(
  Objective object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _objectiveSerialize(
  Objective object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeInt(offsets[0], object.calories);
  writer.writeFloat(offsets[1], object.carbohydrates);
  writer.writeDateTime(offsets[2], object.creationDate);
  writer.writeFloat(offsets[3], object.lipids);
  writer.writeFloat(offsets[4], object.proteins);
  writer.writeFloat(offsets[5], object.saturatedFats);
  writer.writeFloat(offsets[6], object.sugars);
}

Objective _objectiveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Objective();
  object.calories = reader.readIntOrNull(offsets[0]);
  object.carbohydrates = reader.readFloatOrNull(offsets[1]);
  object.creationDate = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.lipids = reader.readFloatOrNull(offsets[3]);
  object.proteins = reader.readFloatOrNull(offsets[4]);
  object.saturatedFats = reader.readFloatOrNull(offsets[5]);
  object.sugars = reader.readFloatOrNull(offsets[6]);
  return object;
}

P _objectiveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readIntOrNull(offset)) as P;
    case 1:
      return (reader.readFloatOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readFloatOrNull(offset)) as P;
    case 4:
      return (reader.readFloatOrNull(offset)) as P;
    case 5:
      return (reader.readFloatOrNull(offset)) as P;
    case 6:
      return (reader.readFloatOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _objectiveGetId(Objective object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _objectiveGetLinks(Objective object) {
  return [];
}

void _objectiveAttach(IsarCollection<dynamic> col, Id id, Objective object) {
  object.id = id;
}

extension ObjectiveQueryWhereSort
    on QueryBuilder<Objective, Objective, QWhere> {
  QueryBuilder<Objective, Objective, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhere> anyCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'creationDate'),
      );
    });
  }
}

extension ObjectiveQueryWhere
    on QueryBuilder<Objective, Objective, QWhereClause> {
  QueryBuilder<Objective, Objective, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'creationDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateEqualTo(
      DateTime? creationDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'creationDate',
        value: [creationDate],
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateNotEqualTo(
      DateTime? creationDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [],
              upper: [creationDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [creationDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [creationDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [],
              upper: [creationDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateGreaterThan(
    DateTime? creationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [creationDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateLessThan(
    DateTime? creationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [],
        upper: [creationDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterWhereClause> creationDateBetween(
    DateTime? lowerCreationDate,
    DateTime? upperCreationDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [lowerCreationDate],
        includeLower: includeLower,
        upper: [upperCreationDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ObjectiveQueryFilter
    on QueryBuilder<Objective, Objective, QFilterCondition> {
  QueryBuilder<Objective, Objective, QAfterFilterCondition> caloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      caloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> caloriesEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> caloriesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> caloriesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> caloriesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      carbohydratesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> creationDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      creationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> creationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipids',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipids',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipids',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> lipidsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipids',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> proteinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      proteinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> proteinsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proteins',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> proteinsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proteins',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> proteinsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proteins',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> proteinsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proteins',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saturatedFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saturatedFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saturatedFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition>
      saturatedFatsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saturatedFats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sugars',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sugars',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sugars',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Objective, Objective, QAfterFilterCondition> sugarsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sugars',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ObjectiveQueryObject
    on QueryBuilder<Objective, Objective, QFilterCondition> {}

extension ObjectiveQueryLinks
    on QueryBuilder<Objective, Objective, QFilterCondition> {}

extension ObjectiveQuerySortBy on QueryBuilder<Objective, Objective, QSortBy> {
  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> sortBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension ObjectiveQuerySortThenBy
    on QueryBuilder<Objective, Objective, QSortThenBy> {
  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<Objective, Objective, QAfterSortBy> thenBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension ObjectiveQueryWhereDistinct
    on QueryBuilder<Objective, Objective, QDistinct> {
  QueryBuilder<Objective, Objective, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lipids');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteins');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saturatedFats');
    });
  }

  QueryBuilder<Objective, Objective, QDistinct> distinctBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugars');
    });
  }
}

extension ObjectiveQueryProperty
    on QueryBuilder<Objective, Objective, QQueryProperty> {
  QueryBuilder<Objective, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Objective, int?, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<Objective, double?, QQueryOperations> carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<Objective, DateTime?, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<Objective, double?, QQueryOperations> lipidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lipids');
    });
  }

  QueryBuilder<Objective, double?, QQueryOperations> proteinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteins');
    });
  }

  QueryBuilder<Objective, double?, QQueryOperations> saturatedFatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saturatedFats');
    });
  }

  QueryBuilder<Objective, double?, QQueryOperations> sugarsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugars');
    });
  }
}
