import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_view.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class FoodKindCard extends StatelessWidget {
  FoodKindCard({super.key, required this.foodKind, required this.image});
  String foodKind;
  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CustomPageRoute(child: RestaurantByKindView(kind: foodKind)),
          );
        },
        child: Container(
          height: 200,
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
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    foodKind,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
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
