import 'package:tawelty_app/Features/explore/services/get_unsplash_images_service.dart';
import 'package:tawelty_app/constants.dart';

Future<String> getMealImage(meal) async {
  String? mealImage;
  List<String>? images = await GetUnsplashImagesService().getUnsplashImages(
    meal,
  );
  if (images[0] != null || images[0].isNotEmpty) {
    mealImage = images[0];
  } else {
    mealImage = image;
  }

  return mealImage;
}
