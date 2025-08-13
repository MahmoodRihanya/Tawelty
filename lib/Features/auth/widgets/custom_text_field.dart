import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.obscureText = false,
    this.hintText,
    required this.onChanged,
    this.icon,
    this.validator,
  });
  Function(String)? onChanged;
  bool? obscureText;
  String? hintText;
  Widget? icon;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextFormField(
        obscureText: obscureText!,
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor),
          ),
          errorStyle: TextStyle(color: kprimaryColor),

          prefix: icon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor),
          ),
        ),
      ),
    );
  }
}
