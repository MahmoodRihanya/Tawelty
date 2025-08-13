import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/views/filter_view.dart';
import 'package:tawelty_app/Features/explore/views/restaurant_by_kind/restaurant_by_kind_view.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/custom_page_route.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (data) {
        Navigator.of(
          context,
        ).push(CustomPageRoute(child: RestaurantByKindView(kind: data)));
      },
      textAlign: TextAlign.end,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kprimaryColor),
        ),

        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(Icons.search, color: kgreyColor),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, FilterView.ID);
          },
          icon: Icon(Icons.tune, color: Colors.grey),
        ),

        filled: true,
        fillColor: Colors.white,
        hintText: 'ابحث عن طعام,مطعم,مناسبة',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: kprimaryColor),
        ),
      ),
    );
  }
}
