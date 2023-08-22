// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_aliment_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecipeAlimentCollection on Isar {
  IsarCollection<RecipeAliment> get recipeAliments => this.collection();
}

const RecipeAlimentSchema = CollectionSchema(
  name: r'RecipeAliment',
  id: -7103870722234245292,
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
    r'dose': PropertySchema(
      id: 2,
      name: r'dose',
      type: IsarType.string,
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
    r'quantity': PropertySchema(
      id: 5,
      name: r'quantity',
      type: IsarType.int,
    ),
    r'saturatedFat': PropertySchema(
      id: 6,
      name: r'saturatedFat',
      type: IsarType.float,
    ),
    r'sugars': PropertySchema(
      id: 7,
      name: r'sugars',
      type: IsarType.float,
    )
  },
  estimateSize: _recipeAlimentEstimateSize,
  serialize: _recipeAlimentSerialize,
  deserialize: _recipeAlimentDeserialize,
  deserializeProp: _recipeAlimentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'recipe': LinkSchema(
      id: -944611800953094446,
      name: r'recipe',
      target: r'Recipe',
      single: true,
    ),
    r'aliment': LinkSchema(
      id: -7863505916073223436,
      name: r'aliment',
      target: r'Aliment',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _recipeAlimentGetId,
  getLinks: _recipeAlimentGetLinks,
  attach: _recipeAlimentAttach,
  version: '3.1.0+1',
);

int _recipeAlimentEstimateSize(
  RecipeAliment object,
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

void _recipeAlimentSerialize(
  RecipeAliment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeInt(offsets[0], object.calories);
  writer.writeFloat(offsets[1], object.carbohydrates);
  writer.writeString(offsets[2], object.dose);
  writer.writeFloat(offsets[3], object.lipids);
  writer.writeFloat(offsets[4], object.proteins);
  writer.writeInt(offsets[5], object.quantity);
  writer.writeFloat(offsets[6], object.saturatedFat);
  writer.writeFloat(offsets[7], object.sugars);
}

RecipeAliment _recipeAlimentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeAliment();
  object.calories = reader.readIntOrNull(offsets[0]);
  object.carbohydrates = reader.readFloatOrNull(offsets[1]);
  object.dose = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.lipids = reader.readFloatOrNull(offsets[3]);
  object.proteins = reader.readFloatOrNull(offsets[4]);
  object.quantity = reader.readIntOrNull(offsets[5]);
  object.saturatedFat = reader.readFloatOrNull(offsets[6]);
  object.sugars = reader.readFloatOrNull(offsets[7]);
  return object;
}

P _recipeAlimentDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readFloatOrNull(offset)) as P;
    case 4:
      return (reader.readFloatOrNull(offset)) as P;
    case 5:
      return (reader.readIntOrNull(offset)) as P;
    case 6:
      return (reader.readFloatOrNull(offset)) as P;
    case 7:
      return (reader.readFloatOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeAlimentGetId(RecipeAliment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeAlimentGetLinks(RecipeAliment object) {
  return [object.recipe, object.aliment];
}

void _recipeAlimentAttach(
    IsarCollection<dynamic> col, Id id, RecipeAliment object) {
  object.id = id;
  object.recipe.attach(col, col.isar.collection<Recipe>(), r'recipe', id);
  object.aliment.attach(col, col.isar.collection<Aliment>(), r'aliment', id);
}

extension RecipeAlimentQueryWhereSort
    on QueryBuilder<RecipeAliment, RecipeAliment, QWhere> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecipeAlimentQueryWhere
    on QueryBuilder<RecipeAliment, RecipeAliment, QWhereClause> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterWhereClause> idBetween(
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

extension RecipeAlimentQueryFilter
    on QueryBuilder<RecipeAliment, RecipeAliment, QFilterCondition> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      caloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      caloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      caloriesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      caloriesBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      carbohydratesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      carbohydratesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dose',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dose',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> doseEqualTo(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseGreaterThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseLessThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> doseBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseStartsWith(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseEndsWith(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dose',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> doseMatches(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dose',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      doseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dose',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      lipidsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      lipidsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      lipidsEqualTo(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      lipidsLessThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      lipidsBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      proteinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      proteinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      proteinsEqualTo(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      proteinsBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      quantityBetween(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saturatedFat',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saturatedFat',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saturatedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saturatedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saturatedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      saturatedFatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saturatedFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      sugarsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      sugarsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      sugarsEqualTo(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      sugarsLessThan(
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

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      sugarsBetween(
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

extension RecipeAlimentQueryObject
    on QueryBuilder<RecipeAliment, RecipeAliment, QFilterCondition> {}

extension RecipeAlimentQueryLinks
    on QueryBuilder<RecipeAliment, RecipeAliment, QFilterCondition> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> recipe(
      FilterQuery<Recipe> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'recipe');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      recipeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'recipe', 0, true, 0, true);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition> aliment(
      FilterQuery<Aliment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'aliment');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterFilterCondition>
      alimentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'aliment', 0, true, 0, true);
    });
  }
}

extension RecipeAlimentQuerySortBy
    on QueryBuilder<RecipeAliment, RecipeAliment, QSortBy> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortBySaturatedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFat', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      sortBySaturatedFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFat', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> sortBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension RecipeAlimentQuerySortThenBy
    on QueryBuilder<RecipeAliment, RecipeAliment, QSortThenBy> {
  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenBySaturatedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFat', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy>
      thenBySaturatedFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFat', Sort.desc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QAfterSortBy> thenBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension RecipeAlimentQueryWhereDistinct
    on QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> {
  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct>
      distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctByDose(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dose', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lipids');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteins');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct>
      distinctBySaturatedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saturatedFat');
    });
  }

  QueryBuilder<RecipeAliment, RecipeAliment, QDistinct> distinctBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugars');
    });
  }
}

extension RecipeAlimentQueryProperty
    on QueryBuilder<RecipeAliment, RecipeAliment, QQueryProperty> {
  QueryBuilder<RecipeAliment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecipeAliment, int?, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<RecipeAliment, double?, QQueryOperations>
      carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<RecipeAliment, String?, QQueryOperations> doseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dose');
    });
  }

  QueryBuilder<RecipeAliment, double?, QQueryOperations> lipidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lipids');
    });
  }

  QueryBuilder<RecipeAliment, double?, QQueryOperations> proteinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteins');
    });
  }

  QueryBuilder<RecipeAliment, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<RecipeAliment, double?, QQueryOperations>
      saturatedFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saturatedFat');
    });
  }

  QueryBuilder<RecipeAliment, double?, QQueryOperations> sugarsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugars');
    });
  }
}
