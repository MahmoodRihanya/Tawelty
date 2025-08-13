import 'package:tawelty_app/Features/explore/models/meal_model.dart';
import 'package:tawelty_app/Features/explore/models/review_model.dart';
import 'package:tawelty_app/Features/explore/services/get_meals.dart';
import 'package:tawelty_app/Features/explore/services/get_reviews.dart';

class RestaurantDetailsModel {
  final String? caption;
  final String? ranking;
  final String? description;
  final String? website;
  final String? writeReviewWeb;
  final String? phone;
  final List<ReviewModel?>? reviews;
  final Future<List<MealModel?>>? meals;
  final String? date;
  RestaurantDetailsModel({
    required this.date,
    required this.meals,
    required this.caption,
    required this.description,
    required this.ranking,
    required this.reviews,
    required this.website,
    required this.writeReviewWeb,
    required this.phone,
  });
  factory RestaurantDetailsModel.fromjson(jsondata) {
    
    return RestaurantDetailsModel(
      date: jsondata["uploaded_date"],
      meals: getMealss(jsondata["dishes"]),
      phone: jsondata["phone"],
      caption: jsondata["caption"],
      description:
          '${jsondata["description"]},${jsondata["establishment_category_ranking"]}',
      ranking: jsondata["ranking"],
      reviews: getReviews(jsondata["reviews"]),
      website: jsondata["web_url"],
      writeReviewWeb: jsondata["write_review"],
    );
  }
}
