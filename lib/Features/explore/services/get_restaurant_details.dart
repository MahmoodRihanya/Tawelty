import 'package:tawelty_app/Features/explore/models/resturant_details_model.dart';
import 'package:tawelty_app/Features/explore/services/api.dart';

Future<RestaurantDetailsModel> getRestaurantDetailes(locationid) async {
  Map<String, dynamic> restaurantDetails = await CustomApi().get(
    url:
        'https://travel-advisor.p.rapidapi.com/restaurants/get-details?location_id=$locationid&lang=ar',
  );

  return RestaurantDetailsModel.fromjson(restaurantDetails);
}
