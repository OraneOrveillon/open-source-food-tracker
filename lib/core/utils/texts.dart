abstract class AppBarTexts {
  static const String aliments = 'Aliments';
  static const String weighings = 'Weighings';
  static const String recipes = 'Recipes';
  static const String objectives = 'Objectives';
  static const String brands = 'Brands';
}

abstract class ButtonTexts {
  static const String ok = "OK";
  static const String cancel = "CANCEL";
  static const String addAliment = "Add aliment";
}

abstract class InputLabelTexts {
  static const String calories = 'Calories';
  static const String proteins = 'Proteins';
  static const String carbohydrates = 'Carbohydrates';
  static const String sugars = 'Sugars';
  static const String lipids = 'Lipids';
  static const String saturatedFats = 'Saturated fats';

  static const String name = 'Name';
  static const String barcode = 'Barcode';
  static const String brands = 'Brands';
  static const String categories = 'Categories';
  static const String nutriscore = 'Nutriscore';
  static const String unit = 'Unit';
  static const String servingQuantity = 'Serving quantity';

  static const String tags = 'Tags';
  static const String portions = 'Number of portions';
  static const String description = 'Description';

  static const String dose = 'Dose';
  static const String quantity = 'Quantity';
}

abstract class InputSuffixTexts {
  static const String kg = 'kg';
  static String Function(String unit) kcal100 = (unit) => 'kcal/100$unit';
  static String Function(String unit) g100 = (unit) => 'g/100$unit';
  static const String kcalD = 'kcal/d';
  static const String gD = 'g/d';
}

abstract class InputHintTexts {}

abstract class DialogTexts {
  static const String addBrand = 'Add a brand';
  static const String addCategory = 'Add a category';
  static const String addTag = 'Add a tag';
  static const String addWeighing = 'Add a weighing';
  static const String editWeighing = 'Edit a weighing';
}

abstract class SectionTexts {
  static const String general = 'General';
  static const String nutrition = 'Nutrition';
  static const String doses = 'Doses';
  static const String aliments = 'Aliments';
}

abstract class ItemTexts {
  static const String camera = 'From camera';
  static const String gallery = 'From gallery';
}

abstract class ContentTexts {}
