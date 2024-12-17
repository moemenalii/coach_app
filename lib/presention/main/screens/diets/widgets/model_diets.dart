class Diets {
  final String images;
  final String nameDiet;
  final String title;
  final int totalCarb;
  final int totalProtein;
  final int totalFat;

  Diets(
      {required this.images,
      required this.nameDiet,
      required this.title,
      required this.totalCarb,
      required this.totalProtein,
      required this.totalFat});
}

final List<Diets> diet = [
  Diets(
    images: "assets/images/Rectangle 3.png",
    title: "Time-tested and proven, No food os off-limits",
    nameDiet: " ",
    totalCarb: 1,
    totalProtein: 1,
    totalFat: 1,
  ),
  Diets(
      images: "assets/images/Rectangle 4.png",
      nameDiet: "Low-Carb",
      title: "Pump up protein and put brakes on carbs to get faster results",
      totalCarb: 130,
      totalProtein: 259,
      totalFat: 115),
  Diets(
      images: "assets/images/Rectangle 5.png",
      nameDiet: "Keto",
      title: "Limit carbs and pump up fats to burn fat more effectively",
      totalCarb: 32,
      totalProtein: 130,
      totalFat: 216),
  Diets(
      images: "assets/images/Rectangle 6.png",
      nameDiet: "High-Protein",
      title: "Power with protein to curb hunger and build strong muscles",
      totalCarb: 414,
      totalProtein: 150,
      totalFat: 58),
  Diets(
      images: "assets/images/Rectangle 7.png",
      nameDiet: "Low-Fat",
      title: "Naturally low-fat and nutrient-rich foods for weight loss.",
      totalCarb: 357,
      totalProtein: 130,
      totalFat: 72),
  Diets(
      images: "assets/images/Rectangle 8.png",
      nameDiet: "Mediterranean",
      title: "enjoy mediterranean flavors, promote whole-body health",
      totalCarb: 324,
      totalProtein: 97,
      totalFat: 101),
  Diets(
      images: "assets/images/Rectangle 9.png",
      nameDiet: "Vegetarian",
      title: "Eat deliciously without meat. Get healthier with more veggies",
      totalCarb: 292,
      totalProtein: 130,
      totalFat: 101),
  Diets(
      images: "assets/images/Rectangle 10.png",
      nameDiet: "Vegan",
      title: "A solely plant-based diet that comes with major health benefits",
      totalCarb: 292,
      totalProtein: 130,
      totalFat: 101),
];
