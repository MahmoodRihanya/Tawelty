import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: kprimaryColor),
  );
}
