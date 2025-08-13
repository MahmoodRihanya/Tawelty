import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/helper/show_snack_par.dart';
import 'package:tawelty_app/Features/explore/views/all_resturant_view.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_view.dart';

import 'package:tawelty_app/Features/explore/widgets/components/kind_component.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/custom_page_route.dart';

import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class FilterView extends StatefulWidget {
  FilterView({super.key});
  static final String ID = 'FilterView';

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  String? typeFilter;
  Color specialColor = kgreyColor;
  Color updatedColor = kgreyColor;
  Color ratingColor = kgreyColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: AppIcons.previous,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text(
                'فلترة المطاعم',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'ابحث عن المطاعم بناء على تفضيلاتك',
                  style: TextStyle(color: kgreyColor),
                ),
              ),
              Divider(),
              Text("الموقع", style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    AppIcons.location,
                    Text(
                      currentUserLocality,
                      style: TextStyle(color: kgreyColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('فرز حسب', style: TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kbackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updatedColor = kgreyColor;
                          ratingColor = kgreyColor;
                          specialColor = kprimaryColor;
                        });
                        typeFilter = 'مميز';
                      },
                      child: Text(
                        'مميز',
                        style: TextStyle(color: specialColor, fontSize: 16),
                      ),
                    ),
                    VerticalDivider(indent: 15, endIndent: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updatedColor = kprimaryColor;
                          ratingColor = kgreyColor;
                          specialColor = kgreyColor;
                        });
                        typeFilter = 'الاحدث';
                      },
                      child: Text(
                        'الاحدث',
                        style: TextStyle(color: updatedColor, fontSize: 16),
                      ),
                    ),
                    VerticalDivider(indent: 15, endIndent: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updatedColor = kgreyColor;
                          ratingColor = kprimaryColor;
                          specialColor = kgreyColor;
                        });
                        typeFilter = 'التقييم';
                      },
                      child: Text(
                        'التقييم',
                        style: TextStyle(color: ratingColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('فلترة', style: TextStyle(fontSize: 20)),
              ),
              GestureDetector(
                child: KindComponent(kind: 'نوع الأكل'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AllResturantView.ID,
                    arguments: 'kind',
                  );
                },
              ),
              Divider(),
              GestureDetector(
                child: KindComponent(kind: 'المناسبة'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AllResturantView.ID,
                    arguments: 'opportunity',
                  );
                },
              ),
              Divider(),
              Spacer(flex: 1),
              CustomButton(
                ontap: () {
                  if (typeFilter != null) {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: RestaurantByKindView(kind: typeFilter!),
                      ),
                    );
                  } else {
                    showSnackBar(context, '😊اختر نوع الفلترة من فضلك');
                  }
                },
                text: 'تطبيق الفلتر',
                backGroundColor: kprimaryColor,
                textColor: Colors.white,
                width: 100,
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
