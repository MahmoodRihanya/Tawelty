import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatefulWidget {
  CustomTextFieldPassword({
    super.key,
    this.obscureText = true,
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
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextFormField(
        obscureText: widget.obscureText!,
        validator: widget.validator,
        onChanged: widget.onChanged,
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.obscureText = !widget.obscureText!;
              });
            },
            icon: Icon(Icons.remove_red_eye),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor),
          ),
          errorStyle: TextStyle(color: kprimaryColor),

          prefix: widget.icon,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: kgreyColor),
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
