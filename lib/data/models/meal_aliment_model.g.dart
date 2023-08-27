// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_aliment_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealAlimentCollection on Isar {
  IsarCollection<MealAliment> get mealAliments => this.collection();
}

const MealAlimentSchema = CollectionSchema(
  name: r'MealAliment',
  id: 764505023360953473,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.long,
    ),
    r'carbohydrates': PropertySchema(
      id: 1,
      name: r'carbohydrates',
      type: IsarType.double,
    ),
    r'dose': PropertySchema(
      id: 2,
      name: r'dose',
      type: IsarType.string,
    ),
    r'lipids': PropertySchema(
      id: 3,
      name: r'lipids',
      type: IsarType.double,
    ),
    r'proteins': PropertySchema(
      id: 4,
      name: r'proteins',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 5,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'saturatedFats': PropertySchema(
      id: 6,
      name: r'saturatedFats',
      type: IsarType.double,
    ),
    r'sugars': PropertySchema(
      id: 7,
      name: r'sugars',
      type: IsarType.double,
    )
  },
  estimateSize: _mealAlimentEstimateSize,
  serialize: _mealAlimentSerialize,
  deserialize: _mealAlimentDeserialize,
  deserializeProp: _mealAlimentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'meal': LinkSchema(
      id: 2169030959267545906,
      name: r'meal',
      target: r'Meal',
      single: true,
    ),
    r'aliment': LinkSchema(
      id: 5879511846453468667,
      name: r'aliment',
      target: r'Aliment',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _mealAlimentGetId,
  getLinks: _mealAlimentGetLinks,
  attach: _mealAlimentAttach,
  version: '3.1.0+1',
);

int _mealAlimentEstimateSize(
  MealAliment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dose;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mealAlimentSerialize(
  MealAliment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.carbohydrates);
  writer.writeString(offsets[2], object.dose);
  writer.writeDouble(offsets[3], object.lipids);
  writer.writeDouble(offsets[4], object.proteins);
  writer.writeLong(offsets[5], object.quantity);
  writer.writeDouble(offsets[6], object.saturatedFats);
  writer.writeDouble(offsets[7], object.sugars);
}

MealAliment _mealAlimentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MealAliment();
  object.calories = reader.readLongOrNull(offsets[0]);
  object.carbohydrates = reader.readDoubleOrNull(offsets[1]);
  object.dose = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.lipids = reader.readDoubleOrNull(offsets[3]);
  object.proteins = reader.readDoubleOrNull(offsets[4]);
  object.quantity = reader.readLongOrNull(offsets[5]);
  object.saturatedFats = reader.readDoubleOrNull(offsets[6]);
  object.sugars = reader.readDoubleOrNull(offsets[7]);
  return object;
}

P _mealAlimentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mealAlimentGetId(MealAliment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealAlimentGetLinks(MealAliment object) {
  return [object.meal, object.aliment];
}

void _mealAlimentAttach(
    IsarCollection<dynamic> col, Id id, MealAliment object) {
  object.id = id;
  object.meal.attach(col, col.isar.collection<Meal>(), r'meal', id);
  object.aliment.attach(col, col.isar.collection<Aliment>(), r'aliment', id);
}

extension MealAlimentQueryWhereSort
    on QueryBuilder<MealAliment, MealAliment, QWhere> {
  QueryBuilder<MealAliment, MealAliment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealAlimentQueryWhere
    on QueryBuilder<MealAliment, MealAliment, QWhereClause> {
  QueryBuilder<MealAliment, MealAliment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<MealAliment, MealAliment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterWhereClause> idBetween(
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
}

extension MealAlimentQueryFilter
    on QueryBuilder<MealAliment, MealAliment, QFilterCondition> {
  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      caloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      caloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> caloriesEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      caloriesGreaterThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      caloriesLessThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> caloriesBetween(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      carbohydratesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      carbohydratesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dose',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      doseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dose',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dose',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> doseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dose',
        value: '',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      doseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dose',
        value: '',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> lipidsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      lipidsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> lipidsEqualTo(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      lipidsGreaterThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> lipidsLessThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> lipidsBetween(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      proteinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      proteinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> proteinsEqualTo(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      proteinsGreaterThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      proteinsLessThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> proteinsBetween(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> quantityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      saturatedFatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      saturatedFatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> sugarsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      sugarsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> sugarsEqualTo(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      sugarsGreaterThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> sugarsLessThan(
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

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> sugarsBetween(
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

extension MealAlimentQueryObject
    on QueryBuilder<MealAliment, MealAliment, QFilterCondition> {}

extension MealAlimentQueryLinks
    on QueryBuilder<MealAliment, MealAliment, QFilterCondition> {
  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> meal(
      FilterQuery<Meal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'meal');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> mealIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'meal', 0, true, 0, true);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition> aliment(
      FilterQuery<Aliment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'aliment');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterFilterCondition>
      alimentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'aliment', 0, true, 0, true);
    });
  }
}

extension MealAlimentQuerySortBy
    on QueryBuilder<MealAliment, MealAliment, QSortBy> {
  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy>
      sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy>
      sortBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> sortBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension MealAlimentQuerySortThenBy
    on QueryBuilder<MealAliment, MealAliment, QSortThenBy> {
  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy>
      thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy>
      thenBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QAfterSortBy> thenBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension MealAlimentQueryWhereDistinct
    on QueryBuilder<MealAliment, MealAliment, QDistinct> {
  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByDose(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dose', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lipids');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteins');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saturatedFats');
    });
  }

  QueryBuilder<MealAliment, MealAliment, QDistinct> distinctBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugars');
    });
  }
}

extension MealAlimentQueryProperty
    on QueryBuilder<MealAliment, MealAliment, QQueryProperty> {
  QueryBuilder<MealAliment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MealAliment, int?, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<MealAliment, double?, QQueryOperations> carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<MealAliment, String?, QQueryOperations> doseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dose');
    });
  }

  QueryBuilder<MealAliment, double?, QQueryOperations> lipidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lipids');
    });
  }

  QueryBuilder<MealAliment, double?, QQueryOperations> proteinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteins');
    });
  }

  QueryBuilder<MealAliment, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<MealAliment, double?, QQueryOperations> saturatedFatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saturatedFats');
    });
  }

  QueryBuilder<MealAliment, double?, QQueryOperations> sugarsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugars');
    });
  }
}
