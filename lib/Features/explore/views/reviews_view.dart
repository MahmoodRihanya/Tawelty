import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/resturant_details_model.dart';
import 'package:tawelty_app/Features/explore/models/review_model.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/review_card.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ReviewsView extends StatelessWidget {
  ReviewsView({
    super.key,
    required this.reviews,
    required this.restaurantDetailsModel,
  });
  List<ReviewModel?>? reviews;
  RestaurantDetailsModel restaurantDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        actions: [
          Text(
            "آراء الزوار",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.east, color: kprimaryColor),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviews!.length,
              itemBuilder: (context, index) {
                return ReviewCard(review: reviews![index]);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  ontap: () {
                    if (restaurantDetailsModel.writeReviewWeb != null) {
                      launchUrl(
                        Uri.parse(restaurantDetailsModel.writeReviewWeb!),
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
    );
  }
}
