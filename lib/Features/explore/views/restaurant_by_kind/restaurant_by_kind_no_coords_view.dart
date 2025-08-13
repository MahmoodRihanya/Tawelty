import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class RestaurantsByKindNoCoordsView extends StatelessWidget {
  RestaurantsByKindNoCoordsView({super.key, required this.kind});
  String kind;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(kind, style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: AppIcons.previous,
            ),
          ],
        ),
      ),
      body: Center(child: Text('اذهب الى الخريطة🔍 لتحديد موقعك')),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
