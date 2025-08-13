import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/services/get_near_restaurant_service.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

// import 'package:tawelty_app/globals.dart';

// class GetRestaurantsfilterService {
//   Future<List<RestaurantModel>> filterRestaurantsByKind({
//     required String kind,
//   }) async {
//     List<RestaurantModel> restaurants = await GetNearRestaurantService()
//         .getNearRestaurant(
//           lat: currentUserLat,
//           lng: currentUserLng,
//           limit: 125,
//         );

//     return restaurants.where((restaurant) {
//       final rating = double.tryParse(restaurant.rating ?? '0') ?? 0;
//       final price = restaurant.priceLevel ?? '';
//       final numReviews = restaurant.numReviews ?? 0;
//       final cuisines = restaurant.cuisine ?? [];

//       switch (kind) {
//         case romanticDinner:
//           return rating >= 4.5 && price.contains('\$\$');

//         case birthday:
//           return rating >= 4.0 && numReviews >= 5;

//         case familyDinner:
//           return rating >= 4.0;

//         case businessMeeting:
//           return rating >= 4.0 &&
//               !cuisines.any((c) => c!.contains('بار') || c.contains('حانة'));

//         default:
//           return true;
//       }
//     }).toList();
//   }
// }
class GetRestaurantsfilterService {
  Future<List<RestaurantModel>> filterRestaurantsByKind({
    required String kind,
  }) async {
    // 1. جلب المطاعم
    final restaurants = await GetNearRestaurantService().getNearRestaurant(
      lat: currentUserLat,
      lng: currentUserLng,
      limit: 160,
    );

    // 3. فلترة أولية
    var filtered =
        restaurants.where((r) {
          final rt = double.tryParse(r.rating ?? '0') ?? 0;
          final rev = r.numReviews ?? 0;
          final cuisines = r.cuisine ?? [];
          final name = (r.name ?? '').toLowerCase();

          switch (kind) {
            case romanticDinner:
              return rt >= 4.5 && (r.priceLevel ?? '').contains('\$\$');

            case birthday:
              return rt >= 4.0 && rev >= 3;

            case familyDinner:
              return rt >= 4.0;

            case businessMeeting:
              return rt >= 4.0 &&
                  !cuisines.any(
                    (c) =>
                        c!.toLowerCase().contains('بار') ||
                        c.toLowerCase().contains('حانة'),
                  );

            case italiaFood:
              return cuisines.any(
                (c) =>
                    c!.toLowerCase().contains('إيطالية') ||
                    c.toLowerCase().contains('بيتزا'),
              );

            case asiaFood:
              return cuisines.any((c) {
                final x = c!.toLowerCase();
                return x.contains('آسيوية') ||
                    x.contains('صينية') ||
                    x.contains('يابانية') ||
                    x.contains('تايلاندية') ||
                    x.contains('اللبنانية') ||
                    x.contains('الصينية');
              });

            case fastFood:
              return cuisines.any((c) {
                final x = c!.toLowerCase();
                return x.contains('سريعة') ||
                    x.contains('فاست') ||
                    x.contains('برغر') ||
                    x.contains('ساندويش') ||
                    x.contains('سناك') ||
                    x.contains("بيتزا") ||
                    x.contains("البيتزا");
              });

            case special:
              return rt >= 4.5 && rev >= 2;

            case rating:
              // نرجّع الكل هنا ونفرز بعدين
              return true;

            case update:
              // نرجّع الكل هنا ونفرز بعدين
              return true;

            default:
              // بحث حر: كلمة في الاسم أو المطبخ
              final q = kind.toLowerCase();
              return name.contains(q) ||
                  cuisines.any((c) => c!.toLowerCase().contains(q));
          }
        }).toList();

    // 4. فرز حسب التقييم
    if (kind == rating) {
      filtered.sort((a, b) {
        final ra = double.tryParse(a.rating ?? '0') ?? 0;
        final rb = double.tryParse(b.rating ?? '0') ?? 0;
        return rb.compareTo(ra);
      });
      return filtered;
    }

    // 5. فرز حسب الأحدث (عدد المراجعات)
    if (kind == update) {
      filtered.sort((a, b) {
        final dateA = DateTime.tryParse(a.date ?? '') ?? DateTime(1000);
        final dateB = DateTime.tryParse(b.date ?? '') ?? DateTime(1000);
        return dateB.compareTo(dateA);
      });
      return filtered;
    }

    return filtered;
  }
}
