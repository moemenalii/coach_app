class BodyDataModel {
  final int age;
  final int weight;
  final int height;
  final String gender;

  BodyDataModel({
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
  });

  factory BodyDataModel.fromJson(Map<String, dynamic> jsonData) {
    return BodyDataModel(
      age: jsonData['data']['age'],
      weight: jsonData['data']['weight'],
      height: jsonData['data']['height'], gender:jsonData['data']['gender'] ,
    );
  }
}
