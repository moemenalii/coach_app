class meal {
  final String images;
  final String nameFood;
  final String title;
  final int Carb;
  final int Protein;
  final int Fat;

  meal(
      {required this.images,
        required this.nameFood,
        required this.title,
        required this.Carb,
        required this.Protein,
        required this.Fat});
}

final List<meal> meals = [
  meal(
    images: "assets/images/Rectangle 3.png",
    title: "Time-tested and proven, No food os off-limits",
    nameFood: "chickin grilled ",
    Carb: 1,
    Protein: 199,
    Fat: 1,
  ),
  meal(
      images: "assets/images/Rectangle 6.png",
      nameFood: "fish",
      title: "Power with protein to curb hunger and build strong muscles",
      Carb: 414,
      Protein: 105,
      Fat: 58),
  meal(
      images: "assets/images/Rectangle 4.png",
      nameFood: "eggs",
      title: "Pump up protein and put brakes on carbs to get faster results",
      Carb: 130,
      Protein: 259,
      Fat: 115),
  meal(
      images: "assets/images/Rectangle 5.png",
      nameFood: "shawrma",
      title: "Limit carbs and pump up fats to burn fat more effectively",
      Carb: 32,
      Protein: 130,
      Fat: 216),
  meal(
      images: "assets/images/Rectangle 7.png",
      nameFood: "spagitte",
      title: "Naturally low-fat and nutrient-rich foods for weight loss.",
      Carb: 357,
      Protein: 130,
      Fat: 72),
  meal(
      images: "assets/images/Rectangle 8.png",
      nameFood: "steak",
      title: "enjoy mediterranean flavors, promote whole-body health",
      Carb: 324,
      Protein: 97,
      Fat: 101),
  meal(
      images: "assets/images/Rectangle 9.png",
      nameFood: "salad",
      title: "Eat deliciously without meat. Get healthier with more veggies",
      Carb: 292,
      Protein: 130,
      Fat: 101),

];
