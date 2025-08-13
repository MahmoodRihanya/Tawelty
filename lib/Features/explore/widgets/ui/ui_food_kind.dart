import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/food_kind_card.dart';

class UiFoodKind extends StatelessWidget {
  const UiFoodKind({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodKindCard(
                  image: 'assets/images/italia.jfif',
                  foodKind: 'مأكولات إيطالية',
                ),

                FoodKindCard(
                  image: 'assets/images/fast_food.jfif',
                  foodKind: 'وجبات سريعة',
                ),
              ],
            ),
          ),
          FoodKindCard(
            image: 'assets/images/asia.jfif',
            foodKind: 'مأكولات آسيوية',
          ),
        ],
      ),
    );
  }
}
