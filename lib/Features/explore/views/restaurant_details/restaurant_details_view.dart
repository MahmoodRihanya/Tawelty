import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/bookings/views/details_booking_view.dart';
import 'package:tawelty_app/Features/explore/models/meal_model.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/models/resturant_details_model.dart';
import 'package:tawelty_app/Features/explore/services/get_restaurant_details.dart';
import 'package:tawelty_app/Features/explore/views/loading.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_details/restaurant_details_view_no_reviews.dart';
import 'package:tawelty_app/Features/explore/views/reviews_view.dart';
import 'package:tawelty_app/Features/explore/widgets/components/details_component.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/meal_card.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_subtitle.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/review_card.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ResturantDetailsView extends StatefulWidget {
  ResturantDetailsView({super.key, required this.restaurantModel});
  RestaurantModel restaurantModel;

  static final String ID = 'ResturantDetailsView';

  @override
  State<ResturantDetailsView> createState() => _ResturantDetailsViewState();
}

class _ResturantDetailsViewState extends State<ResturantDetailsView> {
  late final Future<RestaurantDetailsModel> futureRestaurantDetails;
  initState() {
    super.initState();
    futureRestaurantDetails = getRestaurantDetailes(
      widget.restaurantModel.locationID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureRestaurantDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          RestaurantDetailsModel restaurantDetails = snapshot.data!;
          if (restaurantDetails.reviews!.isNotEmpty) {
            return Scaffold(
              backgroundColor: kbackgroundColor,
              appBar: AppBar(
                backgroundColor: kbackgroundColor,
                leading: Icon(Icons.bookmark_border, color: kprimaryColor),
                bottom: PreferredSize(
                  preferredSize: Size(16, 16),
                  child: Divider(),
                ),
                actions: [
                  Text(
                    widget.restaurantModel.name!,
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
                          child: Image.network(
                            widget.restaurantModel.images[0],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            widget.restaurantModel.images[1],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            widget.restaurantModel.images[2],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  DetailsComponent(
                    icon: Icon(Icons.restaurant, color: kprimaryColor),
                    title: 'نوع الطعام',
                    description: widget.restaurantModel.cuisine.toString(),
                  ),
                  Divider(),
                  DetailsComponent(
                    icon: Icon(Icons.location_pin, color: kprimaryColor),
                    title: 'الموقع',
                    description: widget.restaurantModel.location!,
                  ),
                  Divider(),
                  DetailsComponent(
                    icon: Icon(Icons.watch_later, color: kprimaryColor),
                    title: 'حالة المطعم',
                    description: widget.restaurantModel.state ?? 'غير محدد',
                  ),
                  Divider(),
                  DetailsComponent(
                    icon: Icon(Icons.star, color: kprimaryColor),
                    title: 'التقييم العام',
                    description:
                        widget.restaurantModel.rating ?? 'لا يوجد تقييم بعد',
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          restaurantDetails.description ?? '',
                          style: TextStyle(color: kgreyColor, fontSize: 17),
                        ),
                        Text(
                          restaurantDetails.caption ?? '',
                          style: TextStyle(color: kgreyColor, fontSize: 17),
                        ),
                        Text(
                          'للتواصل:${restaurantDetails.phone}',
                          style: TextStyle(color: kgreyColor, fontSize: 17),
                        ),
                        Text(
                          ':الموقع الرسمي',

                          style: TextStyle(color: kgreyColor, fontSize: 17),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (restaurantDetails.website != null) {
                              launchUrl(
                                Uri.parse(restaurantDetails.website!),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            restaurantDetails.website ??
                                'الموقع الرسمي غير متاح',
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
                        future: restaurantDetails.meals,
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
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),

                  CustomSubtitle(
                    title: 'اّراء الزوار',
                    ontap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: ReviewsView(
                            restaurantDetailsModel: restaurantDetails,
                            reviews: restaurantDetails.reviews,
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        restaurantDetails.reviews!.length > 2
                            ? 2
                            : restaurantDetails.reviews!.length,
                    itemBuilder: (context, index) {
                      return ReviewCard(
                        review: restaurantDetails.reviews![index],
                      );
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CustomButton(
                          ontap: () {
                            if (restaurantDetails.writeReviewWeb != null) {
                              launchUrl(
                                Uri.parse(restaurantDetails.writeReviewWeb!),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          text: "إضافة رأي",
                          backGroundColor: kprimaryColor,
                          textColor: Colors.white,
                          width: 150,
                        ),
                      ),
                    ],
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
                              restaurant: widget.restaurantModel,
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
          } else {
            return RestaurantDetailsViewNoReviews(
              restaurantDetailsModel: restaurantDetails,
              restaurantModel: widget.restaurantModel,
            );
          }
        } else if (snapshot.hasError) {
          print(
            'حدث خطأ:\n${snapshot.error}\n\n'
            'Stack trace:\n${snapshot.stackTrace}',
          );
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text(
                    'حدث خطأ: ${snapshot.error}', // هنا نعرض محتوى الخطأ
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Stack trace:\n${snapshot.stackTrace}', // هنا نعرض محتوى الخطأ
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
