class MealModel {
  String name;
  String image;

  MealModel({required this.name, required this.image});

  factory MealModel.fromjson(jsondata, image) {
    return MealModel(name: jsondata[0]['name'] ?? '', image: image);
  }
}
