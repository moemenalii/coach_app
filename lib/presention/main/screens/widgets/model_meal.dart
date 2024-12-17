class Meal {
  final String icon;
  final String slug;
  final int cals;
  final int carb;
  final int protein;
  final int fat;

  Meal({
    required this.icon,
    required this.slug,
    required this.cals,
    required this.carb,
    required this.protein,
    required this.fat,
  });
}

final List<Meal> searchList = [
  Meal(
    slug: "banana-and-oat-pudding",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy3Y9zkVv2ydLH6Ryjdisa3vIExYpObZU4BQ&s",
    cals: 478,
    protein: 19,
    carb: 79,
    fat: 9,
  ),
  Meal(
    slug: "greek-quinoa-salad",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuNYrFPnAjgRubKhMzDuyFS5GFO2rFwnKkEw&s",
    cals: 441,
    protein: 20,
    carb: 70,
    fat: 9,
  ),
  Meal(
    slug: "gluten-free-bread",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSV_kgmJCZXUcpozVryDUmdF1cwGnrj637hA&s",
    cals: 249,
    protein: 12,
    carb: 48,
    fat: 1,
  ),
  Meal(
    slug: "lemon-shrimp-noodles",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxjKUYzfTnvcyDsrw7yqU_PK5fNfedS_bn-Q&s",
    cals: 347,
    protein: 34,
    carb: 37,
    fat: 7,
  ),
  Meal(
    slug: "eggs-with-smoked-turkey-breast",
    icon:
        "https://supermancooks.com/wp-content/uploads/2022/04/eggs-benedict-turkey-bacon.F-1.jpg",
    cals: 292,
    protein: 25,
    carb: 3,
    fat: 20,
  ),
  Meal(
    slug: "grilled-salmon",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8V8TSW0QRwfjwm_Y6Vdu1tYMli6LehChAjA&s",
    cals: 210,
    protein: 20,
    carb: 1,
    fat: 14,
  ),
  Meal(
    slug: "grilled-chicken-with-lemon",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSECmOBkjXj6vpLiUWRiN2JKiL08VWCvD_lCA&s",
    cals: 217,
    protein: 30,
    carb: 4,
    fat: 9,
  ),
  Meal(
    slug: "cucumber-and-dill-salad",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7nAjKRT27XyQdKJ6sVuSZqLVYSDj_82lXRQ&s",
    cals: 509,
    protein: 7,
    carb: 10,
    fat: 49,
  ),
  Meal(
    slug: "tuna-salad",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR91pPJNhVxEkVew-c5znKqr90ngAAryRHhjQ&s",
    cals: 187,
    protein: 9,
    carb: 4,
    fat: 15,
  ),
  Meal(
    slug: "protein-bar-with-peanut-butter",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlS5TcNRS4kgRN4c4Wn7ZAoZtIr3JH8lLSnA&s",
    cals: 385,
    protein: 86,
    carb: 83,
    fat: 101,
  ),
  Meal(
    slug: "pasta-salad",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeHUMRtyCFIhKIiS5wt87dtmQWss-4YN97hg&s",
    cals: 507,
    protein: 20,
    carb: 100,
    fat: 3,
  ),
  Meal(
    slug: "walnut-energy-balls",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLRfKYsB3da4VlUnKL41Xv-lTABwhGH6Qicw&s",
    cals: 884,
    protein: 83,
    carb: 200,
    fat: 38,
  ),
  Meal(
    slug: "brownies",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbBqssxh515q1P_IzK3sw2vIrrrlKSqgWSZg&s",
    cals: 614,
    protein: 106,
    carb: 59,
    fat: 106,
  ),
  Meal(
    slug: "oatmeal-cookies",
    icon:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDuT-5S9ulBRiriZUNgv6En9qyKzxGmc4PJA&s",
    cals: 884,
    protein: 83,
    carb: 400,
    fat: 328,
  ),
];
