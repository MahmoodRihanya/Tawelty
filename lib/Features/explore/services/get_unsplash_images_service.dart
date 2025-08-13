import 'dart:convert';
import 'package:http/http.dart' as http;

class GetUnsplashImagesService {
  Future<List<String>> getUnsplashImages(String kind) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.unsplash.com/search/photos?query=restaurant%20$kind&per_page=3&client_id=Rp22hgii57Y_XHF8v8F1C229WentoRBKhCCJpXZfAYI',
        ),
      );

      if (response.statusCode != 200) {
        return [];
      }

      final res = jsonDecode(response.body);
      final data = res['results'] as List<dynamic>;

      List<String> images = [];

      for (int i = 0; i < data.length && i < 3; i++) {
        final imageUrl = data[i]['urls']['regular'] as String?;
        if (imageUrl != null) {
          images.add(imageUrl);
        }
      }

      return images;
    } catch (e) {
      print('❌ استثناء أثناء جلب الصور: $e');
      return [];
    }
  }
}
