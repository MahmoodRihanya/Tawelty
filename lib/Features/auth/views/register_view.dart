import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tawelty_app/Features/auth/services/create_user.dart';
import 'package:tawelty_app/Features/auth/views/login_view.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_google_butten.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_text_field.dart';
import 'package:tawelty_app/Features/auth/widgets/custom_text_field_password.dart';
import 'package:tawelty_app/custom_page_route.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static final ID = 'registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;

  String? password;

  bool isLoading = false;
  Icon checkIcon = Icon(
    Icons.check_box_outline_blank_sharp,
    color: Colors.grey,
  );
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CustomPageRoute(
                                child: LoginView(),
                                direction: AxisDirection.up,
                              ),
                            );
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: Colors.grey, fontSize: 24),
                          ),
                        ),
                        Text(
                          'إنشاء حساب',
                          style: TextStyle(color: kprimaryColor, fontSize: 24),
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
                        email = data;
                      },
                      hintText: 'ادخل بريدك الالكتروني',
                    ),
                    Text('كلمة السر', style: TextStyle(fontSize: 18)),
                    CustomTextFieldPassword(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'ادخل كلمة السر',
                      validator: (data) {
                        if (data.toString().isEmpty) {
                          return 'هذا الحقل مطلوب';
                        } else if (data.toString().length < 8) {
                          return 'كلمة سر ضعيفة مثال(12345678)';
                        }
                        return null;
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'أوافق على منح التطبيق اذن الوصول الى موقعي الجغرافي',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        IconButton(
                          icon: checkIcon,
                          onPressed: () {
                            setState(() {
                              checkIcon = Icon(
                                Icons.check_box,
                                color: kprimaryColor,
                              );
                            });
                          },
                        ),
                      ],
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

                            await createUser(email!, password!, context);

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },

                        text: 'إنشاء حساب',
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
