import 'package:flutter/material.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/helper/go_to_login_direct.dart';
import 'package:tawelty_app/Features/onboarding/views/review_bookings_view.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_circle_icon.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_onboarding_appbar.dart';
import 'package:tawelty_app/constants.dart';

class BookingInSecondsView extends StatelessWidget {
  const BookingInSecondsView({super.key});
  static final String ID = 'ViewTwo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomOnboardingAppbar(),
          SizedBox(height: 25),
          Image.asset('assets/images/view2.jpg'),
          SizedBox(height: 25),
          Text('احجز طاولتك في ثوان', style: TextStyle(fontSize: 40)),
          SizedBox(height: 10),
          Text(
            'حدد التاريخ,الوقت,وعدد الاشخاص واحجز طاولتك',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text('بكل سهولة', style: TextStyle(color: Colors.grey, fontSize: 20)),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: kprimaryColor),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(CustomPageRoute(child: ReviewBookingsview()));
                  },
                ),
                Spacer(flex: 1),
                CustomCircleIcon(color: Colors.grey),
                SizedBox(width: 10),
                CustomCircleIcon(color: kprimaryColor),
                SizedBox(width: 10),
                CustomCircleIcon(color: Colors.grey),
                Spacer(flex: 1),
                GestureDetector(
                  child: Text(
                    'تخطي',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  onTap: () {
                    goToAskToLogin(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
