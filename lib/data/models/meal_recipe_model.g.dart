// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_recipe_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealRecipeCollection on Isar {
  IsarCollection<MealRecipe> get mealRecipes => this.collection();
}

const MealRecipeSchema = CollectionSchema(
  name: r'MealRecipe',
  id: 1437346293081335585,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbohydrates': PropertySchema(
      id: 1,
      name: r'carbohydrates',
      type: IsarType.double,
    ),
    r'lipids': PropertySchema(
      id: 2,
      name: r'lipids',
      type: IsarType.double,
    ),
    r'portions': PropertySchema(
      id: 3,
      name: r'portions',
      type: IsarType.double,
    ),
    r'proteins': PropertySchema(
      id: 4,
      name: r'proteins',
      type: IsarType.double,
    ),
    r'saturatedFats': PropertySchema(
      id: 5,
      name: r'saturatedFats',
      type: IsarType.double,
    ),
    r'sugars': PropertySchema(
      id: 6,
      name: r'sugars',
      type: IsarType.double,
    )
  },
  estimateSize: _mealRecipeEstimateSize,
  serialize: _mealRecipeSerialize,
  deserialize: _mealRecipeDeserialize,
  deserializeProp: _mealRecipeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'meal': LinkSchema(
      id: -103158875861513834,
      name: r'meal',
      target: r'Meal',
      single: true,
    ),
    r'recipe': LinkSchema(
      id: -4126936616943649693,
      name: r'recipe',
      target: r'Recipe',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _mealRecipeGetId,
  getLinks: _mealRecipeGetLinks,
  attach: _mealRecipeAttach,
  version: '3.1.0+1',
);

int _mealRecipeEstimateSize(
  MealRecipe object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _mealRecipeSerialize(
  MealRecipe object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.carbohydrates);
  writer.writeDouble(offsets[2], object.lipids);
  writer.writeDouble(offsets[3], object.portions);
  writer.writeDouble(offsets[4], object.proteins);
  writer.writeDouble(offsets[5], object.saturatedFats);
  writer.writeDouble(offsets[6], object.sugars);
}

MealRecipe _mealRecipeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MealRecipe();
  object.calories = reader.readDoubleOrNull(offsets[0]);
  object.carbohydrates = reader.readDoubleOrNull(offsets[1]);
  object.id = id;
  object.lipids = reader.readDoubleOrNull(offsets[2]);
  object.portions = reader.readDoubleOrNull(offsets[3]);
  object.proteins = reader.readDoubleOrNull(offsets[4]);
  object.saturatedFats = reader.readDoubleOrNull(offsets[5]);
  object.sugars = reader.readDoubleOrNull(offsets[6]);
  return object;
}

P _mealRecipeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mealRecipeGetId(MealRecipe object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealRecipeGetLinks(MealRecipe object) {
  return [object.meal, object.recipe];
}

void _mealRecipeAttach(IsarCollection<dynamic> col, Id id, MealRecipe object) {
  object.id = id;
  object.meal.attach(col, col.isar.collection<Meal>(), r'meal', id);
  object.recipe.attach(col, col.isar.collection<Recipe>(), r'recipe', id);
}

extension MealRecipeQueryWhereSort
    on QueryBuilder<MealRecipe, MealRecipe, QWhere> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealRecipeQueryWhere
    on QueryBuilder<MealRecipe, MealRecipe, QWhereClause> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterWhereClause> idBetween(
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

extension MealRecipeQueryFilter
    on QueryBuilder<MealRecipe, MealRecipe, QFilterCondition> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> caloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      caloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> caloriesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      caloriesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> caloriesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> caloriesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      carbohydratesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      carbohydratesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbohydrates',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> lipidsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      lipidsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipids',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> lipidsEqualTo(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> lipidsGreaterThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> lipidsLessThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> lipidsBetween(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> portionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portions',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      portionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portions',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> portionsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      portionsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> portionsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> portionsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> proteinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      proteinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proteins',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> proteinsEqualTo(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> proteinsLessThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> proteinsBetween(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      saturatedFatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      saturatedFatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saturatedFats',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> sugarsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition>
      sugarsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sugars',
      ));
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> sugarsEqualTo(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> sugarsGreaterThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> sugarsLessThan(
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

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> sugarsBetween(
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

extension MealRecipeQueryObject
    on QueryBuilder<MealRecipe, MealRecipe, QFilterCondition> {}

extension MealRecipeQueryLinks
    on QueryBuilder<MealRecipe, MealRecipe, QFilterCondition> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> meal(
      FilterQuery<Meal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'meal');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> mealIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'meal', 0, true, 0, true);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> recipe(
      FilterQuery<Recipe> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'recipe');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterFilterCondition> recipeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'recipe', 0, true, 0, true);
    });
  }
}

extension MealRecipeQuerySortBy
    on QueryBuilder<MealRecipe, MealRecipe, QSortBy> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByPortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portions', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByPortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portions', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> sortBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension MealRecipeQuerySortThenBy
    on QueryBuilder<MealRecipe, MealRecipe, QSortThenBy> {
  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByLipidsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lipids', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByPortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portions', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByPortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portions', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenBySaturatedFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saturatedFats', Sort.desc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.asc);
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QAfterSortBy> thenBySugarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugars', Sort.desc);
    });
  }
}

extension MealRecipeQueryWhereDistinct
    on QueryBuilder<MealRecipe, MealRecipe, QDistinct> {
  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctByLipids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lipids');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctByPortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portions');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteins');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctBySaturatedFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saturatedFats');
    });
  }

  QueryBuilder<MealRecipe, MealRecipe, QDistinct> distinctBySugars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugars');
    });
  }
}

extension MealRecipeQueryProperty
    on QueryBuilder<MealRecipe, MealRecipe, QQueryProperty> {
  QueryBuilder<MealRecipe, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> lipidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lipids');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> portionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portions');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> proteinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteins');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> saturatedFatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saturatedFats');
    });
  }

  QueryBuilder<MealRecipe, double?, QQueryOperations> sugarsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugars');
    });
  }
}
