import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/views/login_view.dart';
import 'package:tawelty_app/Features/auth/views/register_view.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

class AskToLoginView extends StatelessWidget {
  const AskToLoginView({super.key});
  static final String ID = 'AskToLoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/view4.jpg'),
          SizedBox(height: 30),
          Text('مرحباً بك', style: TextStyle(fontSize: 40)),
          Text(
            'قبل الاستمتاع بخدمات طاولتي يرجى تسجيل الدخول اولا',
            style: TextStyle(color: kgreyColor, fontSize: 16),
          ),
          SizedBox(height: 60),
          CustomButton(
            width: 275,
            text: 'إنشاء حساب',
            backGroundColor: kprimaryColor,
            textColor: Colors.white,
            ontap: () {
              Navigator.of(context).push(
                CustomPageRoute(
                  child: RegisterView(),
                  direction: AxisDirection.up,
                ),
              );
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            width: 275,
            text: 'تسجيل الدخول',
            backGroundColor: kprimaryColor.withAlpha(80),
            textColor: kprimaryColor,
            ontap: () {
              Navigator.of(context).push(
                CustomPageRoute(
                  child: LoginView(),
                  direction: AxisDirection.up,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
