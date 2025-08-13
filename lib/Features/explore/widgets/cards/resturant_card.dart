import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/models/resturant_details_model.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_details/restaurant_details_view.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class RestaurantCard extends StatelessWidget {
  RestaurantCard({super.key, required this.restaurant});
  RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bookmark_border, color: kprimaryColor, size: 40),
                  Text(
                    restaurant.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      restaurant.rating ?? 'لا يوجد',
                      style: TextStyle(color: kgreyColor),
                    ),
                    Icon(Icons.star, color: kprimaryColor),
                    Text(
                      restaurant.location ?? 'موقع غير محدد',
                      style: TextStyle(color: kgreyColor),
                    ),
                    AppIcons.location,
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 120.0,
                            child: Image.network(
                              restaurant.images[0] ?? image,
                              height: 120,
                            ),
                          ),
                          Container(
                            height: 100.0,
                            child: Image.network(
                              restaurant.images[1] ?? image,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Image.network(
                          restaurant.images[2] ?? image,
                          height: 220,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomButton(
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ResturantDetailsView(
                            restaurantModel: restaurant,
                          );
                        },
                      ),
                    );
                  },
                  text: 'احجز الان',
                  backGroundColor: kprimaryColor,
                  textColor: Colors.white,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
