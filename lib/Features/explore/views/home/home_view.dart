import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/helper/show_alert_dialog.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/explore/services/get_near_restaurant_service.dart';
import 'package:tawelty_app/Features/explore/views/all_resturant_view.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view_without_coordinates.dart';
import 'package:tawelty_app/Features/explore/views/loading.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/for_home_view/food_kind_card_for_home.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/opportunity_card.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/for_home_view/restaurant_card_for_home.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_search_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_subtitle.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeView({super.key});
  static final String ID = 'HomePage';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final Future<List<RestaurantModel>> futureRestaurants;

  @override
  void initState() {
    super.initState();
    if (currentUserLat == 0 && currentUserLng == 0) {
    } else {
      futureRestaurants = GetNearRestaurantService().getNearRestaurant(
        lat: currentUserLat,
        lng: currentUserLng,
        limit: 3,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLat == 0 && currentUserLng == 0) {
      return HomeViewWithoutCoordinates();
    } else {
      return FutureBuilder<List<RestaurantModel>>(
        future: futureRestaurants,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<RestaurantModel> restaurants = snapshot.data!;
            return Scaffold(
              backgroundColor: kbackgroundColor,
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    icon: Icon(Icons.meeting_room),
                  ),
                ],
                backgroundColor: kbackgroundColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentUserLocality == ''
                          ? 'اذهب الى الخريطة🔍لتحديد موقعك'
                          : '$currentUserLocality',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    AppIcons.location,
                  ],
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.language, color: Colors.grey, size: 32),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomSearchBar(),
                    ),
                    CustomSubtitle(
                      title: 'استكشف المطاعم القريبة',
                      ontap: () {
                        Navigator.pushNamed(
                          context,
                          AllResturantView.ID,
                          arguments: 'near',
                        );
                      },
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: restaurants.length,
                        itemBuilder: (context, index) {
                          return RestaurantCardForHomePage(
                            restaurant: restaurants[index],
                          );
                        },
                      ),
                    ),
                    CustomSubtitle(
                      title: "اختر حسب نوع الطعام",
                      ontap: () {
                        Navigator.pushNamed(
                          context,
                          AllResturantView.ID,
                          arguments: 'kind',
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FoodKindCardForHome(
                              image: 'assets/images/italia.jfif',
                              foodKind: 'مأكولات إيطالية',
                            ),
                            FoodKindCardForHome(
                              image: 'assets/images/asia.jfif',
                              foodKind: 'مأكولات آسيوية',
                            ),
                            FoodKindCardForHome(
                              image: 'assets/images/fast_food.jfif',
                              foodKind: 'وجبات سريعة',
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomSubtitle(
                      title: 'اختر حسب المناسبة',
                      ontap: () {
                        Navigator.pushNamed(
                          context,
                          AllResturantView.ID,
                          arguments: 'opportunity',
                        );
                      },
                    ),
                    Container(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OpportunityCard(
                            opportunity: 'عيد ميلاد',
                            icon: AppIcons.birthday,
                          ),
                          OpportunityCard(
                            opportunity: 'عشاء رومانسي',
                            icon: AppIcons.romanticDinner,
                          ),
                          OpportunityCard(
                            opportunity: 'لقاء عمل',
                            icon: AppIcons.businessMeeting,
                          ),
                          OpportunityCard(
                            opportunity: 'عشاء عائلي',
                            icon: AppIcons.familyDinner,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomBar(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Scaffold(
                body: Center(child: Text('خطأ: ${snapshot.error}')),
              ),
            );
          } else {
            return Loading();
          }
        },
      );
    }
  }
}
