import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/onboarding/service/check_login.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static final String ID = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkLogin(context); // استدعاء الفحص مباشرة عند البداية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/new_logo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
