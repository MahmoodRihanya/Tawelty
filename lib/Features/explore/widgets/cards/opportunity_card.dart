import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_view.dart';

// ignore: must_be_immutable
class OpportunityCard extends StatelessWidget {
  OpportunityCard({required this.opportunity, required this.icon});

  String opportunity;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: icon,
            ),
            Text(opportunity, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantByKindView(kind: opportunity),
          ),
        );
      },
    );
  }
}
