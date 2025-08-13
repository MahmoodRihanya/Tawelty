import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/services/get_near_restaurant_service.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/resturant_card.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

class UiNearRestaurant extends StatefulWidget {
  UiNearRestaurant({super.key});

  @override
  State<UiNearRestaurant> createState() => _UiNearRestaurantState();
}

class _UiNearRestaurantState extends State<UiNearRestaurant> {
  late final Future<List<RestaurantModel>> futureRestaurants;

  @override
  void initState() {
    super.initState();
    if (currentUserLat == 0 && currentUserLng == 0) {
    } else {
      futureRestaurants = GetNearRestaurantService().getNearRestaurant(
        lat: currentUserLat,
        lng: currentUserLng,
        limit: 25,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLat == 0 && currentUserLng == 0) {
      return Center(
        child: Text(
          'اذهب الى الخريطة🔍 لجلب المطاعم القريبة',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return FutureBuilder<List<RestaurantModel>>(
        future: futureRestaurants,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<RestaurantModel> restaurants = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                itemBuilder: (context, i) {
                  return RestaurantCard(restaurant: restaurants[i]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text('${snapshot.error}')));
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: kprimaryColor,
              ),
            );
          }
        },
      );
    }
  }
}
