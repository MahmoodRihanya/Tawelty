import 'package:flutter/material.dart';

import 'package:tawelty_app/Features/onboarding/views/ask_to_login_view.dart';

void goToAskToLogin(context) {
  {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AskToLoginView.ID,
      (Route<dynamic> route) => false,
    );
  }
}
