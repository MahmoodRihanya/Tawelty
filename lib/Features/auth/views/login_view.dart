import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tawelty_app/Features/auth/services/sign_in.dart';
import 'package:tawelty_app/Features/auth/views/forgot_password_view.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_google_butten.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_text_field.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_text_field_password.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static final String ID = 'LoginPage';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? password;
  String? gmail;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withAlpha(400),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 750,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 50,

                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(500),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: kprimaryColor, fontSize: 24),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'إنشاء حساب',
                            style: TextStyle(color: Colors.grey, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('البريد الالكتروني', style: TextStyle(fontSize: 18)),
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
                        gmail = data;
                      },
                      hintText: "ادخل بريدك الالكتروني",
                    ),
                    Text('كلمة المرور', style: TextStyle(fontSize: 18)),
                    CustomTextFieldPassword(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'ادخل كلمة المرور',
                      validator: (data) {
                        if (data.toString().isEmpty) {
                          return 'هذا الحقل مطلوب';
                        } else if (data.toString().length < 8) {
                          return 'كلمة سر ضعيفة مثال(12345678)';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPasswordView.ID);
                      },
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(color: kprimaryColor, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 36),

                    Divider(),
                    CustomGoogleButten(),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomButton(
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            await signIn(gmail!, password!, context);

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },

                        text: 'تسجيل دخول',
                        backGroundColor: kprimaryColor,
                        textColor: Colors.white,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
