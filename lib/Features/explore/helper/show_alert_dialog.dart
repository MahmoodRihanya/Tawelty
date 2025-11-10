import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/services/logout.dart';
import 'package:tawelty_app/constants.dart';
// delete dialog
showAlertDialog(BuildContext context) {
  Widget logoutButton = TextButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kbackgroundColor),
    ),
    child: Text('تسجيل خروج', style: TextStyle(color: kprimaryColor)),
    onPressed: () {
      logout(context);
    },
  );
  Widget cancelButton = TextButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kprimaryColor),
    ),

    child: Text("رجوع", style: TextStyle(color: Colors.white)),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("تسجيل خروج", style: TextStyle(color: kprimaryColor)),
    content: Text("هل تريد تسجيل الخروج الان؟"),
    actions: [logoutButton, cancelButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
