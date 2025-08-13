import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tawelty_app/Features/auth/views/forgot_password_view.dart';
import 'package:tawelty_app/Features/auth/views/login_view.dart';
import 'package:tawelty_app/Features/auth/views/register_view.dart';
import 'package:tawelty_app/Features/bookings/views/all_bookings_view.dart';
import 'package:tawelty_app/Features/explore/cubits/ui_component/ui_component_cubit.dart';
import 'package:tawelty_app/Features/explore/views/all_resturant_view.dart';
import 'package:tawelty_app/Features/explore/views/filter_view.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/Features/map/views/map_view.dart';
import 'package:tawelty_app/Features/onboarding/views/ask_to_login_view.dart';
import 'package:tawelty_app/Features/onboarding/views/review_bookings_view.dart';
import 'package:tawelty_app/Features/onboarding/views/splash_view.dart';
import 'package:tawelty_app/Features/onboarding/views/welcome_view.dart';
import 'package:tawelty_app/Features/onboarding/views/booking_in_seconds_view.dart';
import 'package:tawelty_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(
    BlocProvider(create: (context) => UiComponentCubit(), child: TaweltyApp()),
  );
}

class TaweltyApp extends StatelessWidget {
  const TaweltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      routes: {
        FilterView.ID: (context) => FilterView(),
        AllResturantView.ID: (context) => AllResturantView(),
        AllBookingsView.ID: (context) => AllBookingsView(),
        ForgotPasswordView.ID: (context) => ForgotPasswordView(),
        HomeView.ID: (context) => HomeView(),
        MapView.ID: (context) => MapView(),
        RegisterView.ID: (context) => RegisterView(),
        LoginView.ID: (context) => LoginView(),
        SplashView.ID: (context) => SplashView(),
        WelcomeView.ID: (context) => WelcomeView(),
        BookingInSecondsView.ID: (context) => BookingInSecondsView(),
        ReviewBookingsview.ID: (context) => ReviewBookingsview(),
        AskToLoginView.ID: (context) => AskToLoginView(),
      },
      initialRoute: SplashView.ID,
    );
  }
}
