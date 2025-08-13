import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_view.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class FoodKindCardForHome extends StatelessWidget {
  FoodKindCardForHome({super.key, required this.foodKind, required this.image});
  String image;
  String foodKind;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
          ).push(CustomPageRoute(child: RestaurantByKindView(kind: foodKind)));
        },
        child: Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image),
                ),
                SizedBox(height: 4),
                Text(
                  foodKind,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(currentUserCity, style: TextStyle(color: kgreyColor)),
                    AppIcons.location,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
