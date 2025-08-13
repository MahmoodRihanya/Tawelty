import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/review_model.dart';
import 'package:tawelty_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, this.review});
  ReviewModel? review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.star_rate, color: kprimaryColor),

                  Text(
                    review?.rating ?? 'لا يوجد تقييم',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(flex: 1),
                  Text(
                    review?.author ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Text(review?.date ?? '', style: TextStyle(color: kgreyColor)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  textAlign: TextAlign.right,
                  review?.title ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (review!.url != null) {
                    launchUrl(
                      Uri.parse(review!.url!),
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                child: Text(
                  review?.url ?? '',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
