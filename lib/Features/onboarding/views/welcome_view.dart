import 'package:flutter/material.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/helper/go_to_login_direct.dart';
import 'package:tawelty_app/Features/onboarding/views/booking_in_seconds_view.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_circle_icon.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_onboarding_appbar.dart';
import 'package:tawelty_app/constants.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  static final String ID = 'ViewOne';

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomOnboardingAppbar(),
          SizedBox(height: 65),
          Image.asset('assets/images/view1.jpg'),
          SizedBox(height: 65),
          Text('!مرحباً بك في طاولتي', style: TextStyle(fontSize: 40)),
          SizedBox(height: 10),
          Text(
            ',استعرض المطاعم القريبة وتعرف على التفاصيل',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text(
            'الصور,والتقييمات بكل سهولة',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: kprimaryColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(child: BookingInSecondsView()),
                    );
                  },
                ),

                Spacer(flex: 1),
                CustomCircleIcon(color: Colors.grey),
                SizedBox(width: 10),
                CustomCircleIcon(color: Colors.grey),
                SizedBox(width: 10),
                CustomCircleIcon(color: kprimaryColor),
                Spacer(flex: 1),
                GestureDetector(
                  child: Text(
                    'تخطي',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
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
