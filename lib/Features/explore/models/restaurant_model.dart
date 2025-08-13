import 'package:tawelty_app/Features/explore/services/get_unsplash_images_service.dart';
import 'package:tawelty_app/constants.dart';

class RestaurantModel {
  final String? name;
  final String? location;
  final String? rating;
  final List<String> images;
  final int? numReviews;
  final String? priceLevel;
  final List<String?> cuisine;
  final String? locationID;
  final String? state;
  final String? date;
  RestaurantModel({
    required this.date,
    required this.state,
    required this.locationID,
    required this.name,
    required this.location,
    required this.images,
    required this.rating,
    required this.cuisine,
    required this.numReviews,
    required this.priceLevel,
  });

  static Future<List<String>> getRestaurantImages(
    Map<String, dynamic> data,
  ) async {
    String kind;
    if (data["caption"] != null && (data["caption"] as String).isNotEmpty) {
      kind = data["caption"] as String;
    } else if (data["cuisine"] is List &&
        (data["cuisine"] as List).isNotEmpty &&
        data["cuisine"][0]['name'] != null) {
      kind = data["cuisine"][0]['name'] as String;
    } else {
      kind = 'pizza';
    }

    final unsplashImages = await GetUnsplashImagesService().getUnsplashImages(
      kind,
    );

    final List<String?> images = [];
    final photoUrl = data['photo']?['images']?['small']?['url'] as String?;
    if (photoUrl != null && photoUrl.isNotEmpty) {
      images.add(photoUrl);
    }

    for (var url in unsplashImages) {
      images.add(url);
      if (images.length >= 3) break;
    }

    final finalImagesRestaurant =
        images.where((u) => u != null && u.isNotEmpty).cast<String>().toList();

    while (finalImagesRestaurant.length < 3) {
      finalImagesRestaurant.add(image);
    }

    return finalImagesRestaurant;
  }

  factory RestaurantModel.fromjson(jsondata, images) {
    final rawCuisine = jsondata['cuisine'] as List<dynamic>?;

    final List<String> cuisine = [];
    if (rawCuisine != null && rawCuisine.isNotEmpty) {
      for (var item in rawCuisine.take(3)) {
        final name = (item as Map<String, dynamic>)['name'] as String?;
        if (name != null && name.isNotEmpty) {
          cuisine.add(name);
        }
      }
    }

    if (cuisine.isEmpty) {
      cuisine.add('غير محدد');
    }

    return RestaurantModel(
      date: jsondata["uploaded_date"],
      state: jsondata["open_now_text"],
      locationID: jsondata["location_id"],
      numReviews: int.parse(jsondata["num_reviews"]),
      cuisine: cuisine,
      priceLevel: jsondata["price_level"],
      name: jsondata['name'],
      location:
          '${jsondata["address_obj"]["country"]}-${jsondata["address_obj"]["city"]}',
      images: images,
      rating: jsondata["rating"],
    );
  }
}
