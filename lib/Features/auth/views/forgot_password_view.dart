import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/views/login_view.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_text_field.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});
  static final String ID = 'forgotPasswordView';

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String? email;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text('طاولتي', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('البريد الالكتروني', style: TextStyle(fontSize: 24)),
              SizedBox(height: 12),
              CustomTextField(
                validator: (data) {
                  if (data.toString().isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  if (data.toString().endsWith('@gmail.com')) {
                    return null;
                  } else {
                    return 'بريد غير صحيح';
                  }
                },
                onChanged: (data) {
                  email = data;
                },
                hintText: 'ادخل بريدك الالكتروني',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  textAlign: TextAlign.end,
                  'عزيزي المستخدم بالضغط على زر "تأكيد"سوف يتم ارسال رابط تسجيل دخول مباشر الى بريدك رجاءً راجع البريد الوارد للتحقق وشكرا',
                  style: TextStyle(color: kgreyColor),
                ),
              ),

              Center(
                child: CustomButton(
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email!,
                      );
                      Navigator.pushNamed(context, LoginView.ID);
                    }
                  },
                  text: 'تأكيد',
                  backGroundColor: kprimaryColor,
                  textColor: Colors.white,
                  width: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
