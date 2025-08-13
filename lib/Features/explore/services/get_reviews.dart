import 'package:tawelty_app/Features/explore/models/review_model.dart';

List<ReviewModel?>? getReviews(List<dynamic>? reviews) {
  List<ReviewModel?>? reviewsRestaurant = [];
  if (reviews == null || reviews.isEmpty) {
    return reviewsRestaurant;
  } else {
    for (int i = 0; i < reviews.length; i++) {
      reviewsRestaurant.add(ReviewModel.fromjson(reviews[i]));
    }
    return reviewsRestaurant;
  }
}
