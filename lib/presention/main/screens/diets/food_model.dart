class FoodModel {
  List<Data>? data;

  FoodModel({this.data});

  FoodModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((id) {
        data!.add(Data.fromJson(id));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((id) => id.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;

  String? icon;
  double? cals;
  double? protein;
  double? carb;
  double? fat;

  Data({
    this.sId,
    this.name,
    this.icon,
    this.cals,
    this.protein,
    this.carb,
    this.fat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];

    icon = json['icon'];
    cals =
        (json['cals'] is int) ? (json['cals'] as int).toDouble() : json['cals'];
    protein = (json['protein'] is int)
        ? (json['protein'] as int).toDouble()
        : json['protein'];
    carb =
        (json['carb'] is int) ? (json['carb'] as int).toDouble() : json['carb'];
    fat = (json['fat'] is int) ? (json['fat'] as int).toDouble() : json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;

    data['icon'] = icon;
    data['cals'] = cals;
    data['protein'] = protein;
    data['carb'] = carb;
    data['fat'] = fat;

    return data;
  }
}
