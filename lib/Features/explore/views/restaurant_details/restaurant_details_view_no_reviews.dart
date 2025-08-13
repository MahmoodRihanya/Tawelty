import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/bookings/views/details_booking_view.dart';
import 'package:tawelty_app/Features/explore/models/meal_model.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/models/resturant_details_model.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/meal_card.dart';
import 'package:tawelty_app/Features/explore/widgets/components/details_component.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_subtitle.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/globals.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class RestaurantDetailsViewNoReviews extends StatelessWidget {
  RestaurantDetailsViewNoReviews({
    super.key,
    required this.restaurantDetailsModel,
    required this.restaurantModel,
  });
  RestaurantModel restaurantModel;
  RestaurantDetailsModel restaurantDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        leading: Icon(Icons.bookmark_border, color: kprimaryColor),
        bottom: PreferredSize(preferredSize: Size(16, 16), child: Divider()),
        actions: [
          Text(
            restaurantModel.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: IconButton(
              icon: Icon(Icons.east, color: kprimaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.network(restaurantModel.images[0]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(restaurantModel.images[1]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(restaurantModel.images[2]),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          DetailsComponent(
            icon: Icon(Icons.restaurant, color: kprimaryColor),
            title: 'نوع الطعام',
            description: restaurantModel.cuisine.toString(),
          ),
          Divider(),
          DetailsComponent(
            icon: Icon(Icons.location_pin, color: kprimaryColor),
            title: 'الموقع',
            description: restaurantModel.location!,
          ),
          Divider(),
          DetailsComponent(
            icon: Icon(Icons.watch_later, color: kprimaryColor),
            title: 'حالة المطعم',
            description: restaurantModel.state ?? 'غير محدد',
          ),
          Divider(),
          DetailsComponent(
            icon: Icon(Icons.star, color: kprimaryColor),
            title: 'التقييم العام',
            description: restaurantModel.rating ?? 'لا يوجد تقييم بعد',
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  restaurantDetailsModel.description ?? '',
                  style: TextStyle(color: kgreyColor, fontSize: 17),
                ),
                Text(
                  restaurantDetailsModel.caption ?? '',
                  style: TextStyle(color: kgreyColor, fontSize: 17),
                ),
                Text(
                  'للتواصل:${restaurantDetailsModel.phone}',
                  style: TextStyle(color: kgreyColor, fontSize: 17),
                ),
                Text(
                  ':الموقع الرسمي',

                  style: TextStyle(color: kgreyColor, fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    if (restaurantDetailsModel.website != null) {
                      launchUrl(
                        Uri.parse(restaurantDetailsModel.website!),
                        mode: LaunchMode.externalApplication,
                      );
                    } else {}
                  },
                  child: Text(
                    textAlign: TextAlign.end,
                    restaurantDetailsModel.website ?? 'الموقع الرسمي غير متاح',
                    style: TextStyle(color: kprimaryColor),
                  ),
                ),
              ],
            ),
          ),
          CustomSubtitle(title: 'قائمة الطعام', ontap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              height: 150,
              child: FutureBuilder(
                future: restaurantDetailsModel.meals,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    List<MealModel?>? meals = asyncSnapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        if (meals.isNotEmpty || meals != null) {
                          return MealCard(meal: meals[index]!);
                        } else {
                          return Text('لا يوجد قائمة طعام متاحة حاليا');
                        }
                      },
                    );
                  } else if (asyncSnapshot.hasError) {
                    return Text('data');
                  } else {
                    return Text('لا يوجد قائمة طعام متاحة حاليا');
                  }
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              ontap: () {
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: DetailsBookingView(
                      restaurant: restaurantModel,
                      id: currentUserId,
                    ),
                    direction: AxisDirection.up,
                  ),
                );
              },
              text: 'قم بالحجز الان',
              backGroundColor: kprimaryColor,
              textColor: Colors.white,
              width: double.infinity,
            ),
          ),
        ),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
