// import 'package:flutter/material.dart';
// import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
// import 'package:tawelty_app/Features/explore/services/get_restaurant_filter.dart';
// import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_no_coords_view.dart';
// import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
// import 'package:tawelty_app/Features/explore/widgets/customs/custom_search_bar.dart';
// import 'package:tawelty_app/Features/explore/widgets/cards/resturant_card.dart';
// import 'package:tawelty_app/Features/explore/views/loading.dart';
// import 'package:tawelty_app/constants.dart';
// import 'package:tawelty_app/globals.dart';

// // ignore: must_be_immutable
// class RestaurantByKindView extends StatefulWidget {
//   RestaurantByKindView({super.key, required this.kind});
//   static final ID = 'RestaurantsForOneKindView';
//   final String kind;
//   String? restaurantKind;

//   @override
//   State<RestaurantByKindView> createState() => _RestaurantByKindViewState();
// }

// class _RestaurantByKindViewState extends State<RestaurantByKindView> {
//   late final Future<List<RestaurantModel>> futureRestaurants;

//   @override
//   void initState() {
//     switch (widget.kind) {
//       case 'عيد ميلاد':
//         {
//           widget.restaurantKind = birthday;
//           break;
//         }
//       case 'عشاء رومانسي':
//         {
//           widget.restaurantKind = romanticDinner;
//           break;
//         }
//       case 'لقاء عمل':
//         {
//           widget.restaurantKind = businessMeeting;
//           break;
//         }
//       case 'عشاء عائلي':
//         {
//           widget.restaurantKind = familyDinner;
//           break;
//         }
//       case 'مأكولات إيطالية':
//         {
//           widget.restaurantKind = italiaFood;
//           break;
//         }
//       case 'وجبات سريعة':
//         {
//           widget.restaurantKind = fastFood;
//           break;
//         }
//       case 'مأكولات آسيوية':
//         {
//           widget.restaurantKind = asiaFood;
//         }
//       case 'التقييم':
//         {
//           widget.restaurantKind = rating;
//         }
//       case 'الاحدث':
//         {
//           widget.restaurantKind = update;
//         }
//       case 'مميز':
//         {
//           widget.restaurantKind = update;
//         }
//       default:
//         {
//           widget.restaurantKind = widget.kind;
//         }
//     }
//     super.initState();
//     if (currentUserLat == 0 && currentUserLng == 0) {
//     } else {
//       futureRestaurants = GetRestaurantsfilterService().filterRestaurantsByKind(
//         kind: widget.restaurantKind!,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (currentUserLat == 0 && currentUserLng == 0) {
//       return RestaurantsByKindNoCoordsView(kind: widget.kind);
//     }
//     return FutureBuilder<List<RestaurantModel>>(
//       future: futureRestaurants,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<RestaurantModel> restaurants = snapshot.data!;
//           return Scaffold(
//             backgroundColor: kbackgroundColor,
//             appBar: AppBar(
//               backgroundColor: kbackgroundColor,
//               automaticallyImplyLeading: false,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     widget.kind,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.east, color: kprimaryColor),
//                   ),
//                 ],
//               ),
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16, left: 16, top: 22),

//                   child: CustomSearchBar(),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: restaurants.length,
//                     itemBuilder: (context, index) {
//                       return RestaurantCard(restaurant: restaurants[index]);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             bottomNavigationBar: CustomBottomBar(),
//           );
//         } else if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Text(
//                 'حدث خطأ: ${snapshot.error}', // هنا نعرض محتوى الخطأ
//                 style: TextStyle(
//                   color: Colors.red,
//                 ), // اختياري: نجعل لون النص أحمر للتأكيد
//                 textAlign: TextAlign.center, // اختياري: لمحاذاة النص في الوسط
//               ),
//             ),
//           );
//         } else {
//           return Loading();
//         }
//       },
//     );
//   }
// }
// restaurant_by_kind_view.dart

import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/services/get_restaurant_filter.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_no_coords_view.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_search_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/resturant_card.dart';
import 'package:tawelty_app/Features/explore/views/loading.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

class RestaurantByKindView extends StatefulWidget {
  static const ID = 'RestaurantsForOneKindView';
  final String kind;
  RestaurantByKindView({Key? key, required this.kind}) : super(key: key);

  @override
  _RestaurantByKindViewState createState() => _RestaurantByKindViewState();
}

class _RestaurantByKindViewState extends State<RestaurantByKindView> {
  late Future<List<RestaurantModel>> futureRestaurants;
  late String filterKey;
  String searchText = '';

  @override
  void initState() {
    super.initState();

    // تحويل النص الظاهر للمستخدم إلى مفتاح الفلترة الداخلي
    switch (widget.kind) {
      case 'عيد ميلاد':
        filterKey = birthday;
        break;
      case 'عشاء رومانسي':
        filterKey = romanticDinner;
        break;
      case 'لقاء عمل':
        filterKey = businessMeeting;
        break;
      case 'عشاء عائلي':
        filterKey = familyDinner;
        break;
      case 'مأكولات إيطالية':
        filterKey = italiaFood;
        break;
      case 'وجبات سريعة':
        filterKey = fastFood;
        break;
      case 'مأكولات آسيوية':
        filterKey = asiaFood;
        break;
      case 'التقييم':
        filterKey = rating;
        break;
      case 'الاحدث':
        filterKey = update;
        break;
      case 'مميز':
        filterKey = special;
        break;
      default:
        filterKey = widget.kind; // بحث حر
    }

    if (currentUserLat != 0 || currentUserLng != 0) {
      futureRestaurants = GetRestaurantsfilterService().filterRestaurantsByKind(
        kind: filterKey,
      );
    }
  }

  void _onSearchChanged(String text) {
    setState(() {
      searchText = text;
      filterKey = text.isEmpty ? widget.kind : text;
      futureRestaurants = GetRestaurantsfilterService().filterRestaurantsByKind(
        kind: filterKey,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLat == 0 && currentUserLng == 0) {
      return RestaurantsByKindNoCoordsView(kind: widget.kind);
    }

    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget.kind, style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.east, color: kprimaryColor),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // شريط البحث مع تمرير ال callback
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CustomSearchBar(),
          ),
          Expanded(
            child: FutureBuilder<List<RestaurantModel>>(
              future: futureRestaurants,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'حدث خطأ: ${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return Loading();
                }

                final list = snapshot.data!;
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      searchText.isEmpty
                          ? 'لا توجد مطاعم لهذا الفلتر.'
                          : 'لا توجد نتائج لـ "$searchText".',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: list.length,
                  itemBuilder: (_, i) => RestaurantCard(restaurant: list[i]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
