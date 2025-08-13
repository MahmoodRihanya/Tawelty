import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/widgets/cards/opportunity_card.dart';
import 'package:tawelty_app/constants.dart';

class UiOpportunity extends StatelessWidget {
  const UiOpportunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          OpportunityCard(opportunity: 'عيد ميلاد', icon: AppIcons.birthday),
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
    );
  }
}
