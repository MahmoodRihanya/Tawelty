import 'package:tawelty_app/Features/explore/models/meal_model.dart';
import 'package:tawelty_app/Features/explore/services/get_meal_image.dart';

Future<List<MealModel>>? getMealss(List<dynamic>? jsondata) async {
  List<MealModel> meals = [];
  if (jsondata == null || jsondata.isEmpty) {
  } else {
    for (int i = 0; i < jsondata.length; i++) {
      String imageMeal = await getMealImage(jsondata[i]['name']);

      meals.add(MealModel.fromjson(jsondata, imageMeal));
    }
  }
  return meals;
}
