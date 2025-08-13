import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/models/meal_model.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal});
  MealModel meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.network(meal.image, height: 85),
            SizedBox(height: 16),
            Text(meal.name, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
