import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/bookings/views/all_bookings_view.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/Features/explore/widgets/components/bottom_bar_component.dart';
import 'package:tawelty_app/Features/map/views/map_view.dart';
import 'package:tawelty_app/constants.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottombarCombonent(
                  ontap: () {
                    Navigator.pushNamed(context, AllBookingsView.ID);
                  },
                  icon: Icon(Icons.badge, size: 30),
                  text: 'حجوزاتي',
                ),

                BottombarCombonent(
                  ontap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeView.ID,
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: Icon(Icons.home, color: kprimaryColor, size: 30),
                  text: 'الرئيسية',
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MapView.ID);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: kprimaryColor,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: kprimaryColor,
                radius: 40,
                child: Icon(Icons.search, color: Colors.white, size: 50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
