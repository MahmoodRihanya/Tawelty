import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/services/api.dart';

class GetNearRestaurantService {
  Future<List<RestaurantModel>> getNearRestaurant({
    required double lat,
    required double lng,
    required int limit,
  }) async {
    Map<String, dynamic> response = await CustomApi().get(
      url:
          'https://travel-advisor.p.rapidapi.com/restaurants/list-by-latlng?latitude=$lat&longitude=$lng&limit=$limit&lang=ar',
    );
    List<dynamic> nearRestaurants = response['data'];

    List<RestaurantModel> restaurants = [];
    for (int i = 0; i < nearRestaurants.length; i++) {
      List<String?> images = await RestaurantModel.getRestaurantImages(
        nearRestaurants[i],
      );

      restaurants.add(RestaurantModel.fromjson(nearRestaurants[i], images));
    }

    return restaurants;
  }
}
