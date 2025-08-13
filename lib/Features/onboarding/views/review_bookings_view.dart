import 'package:flutter/material.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/helper/go_to_login_direct.dart';
import 'package:tawelty_app/Features/onboarding/views/ask_to_login_view.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_circle_icon.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_onboarding_appbar.dart';
import 'package:tawelty_app/constants.dart';

class ReviewBookingsview extends StatelessWidget {
  const ReviewBookingsview({super.key});
  static final String ID = 'ViewThree';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomOnboardingAppbar(),
          SizedBox(height: 20),
          Image.asset('assets/images/view3.jpg'),
          SizedBox(height: 30),
          Text('تابع حجوزاتك بكل سهولة', style: TextStyle(fontSize: 35)),
          SizedBox(height: 10),
          Text(
            'راجع حجوزاتك الحاليةو عدلها أو ألغها بضغطة زر',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text('واحدة', style: TextStyle(color: Colors.grey, fontSize: 20)),
          SizedBox(height: 75),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: kprimaryColor),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(CustomPageRoute(child: AskToLoginView()));
                  },
                ),
                Spacer(flex: 1),

                CustomCircleIcon(color: kprimaryColor),
                SizedBox(width: 10),
                CustomCircleIcon(color: Colors.grey),
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
