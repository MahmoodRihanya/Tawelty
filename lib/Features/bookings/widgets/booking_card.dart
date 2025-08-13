import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/bookings/models/booking_model.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class BookingCard extends StatelessWidget {
  BookingCard({super.key, required this.booking, required this.onPressed});
  VoidCallback onPressed;
  BookingModel booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                '${booking.month}/${booking.day}',
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(flex: 1),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('حذف', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(kprimaryColor),
                ),
              ),
            ],
          ),
          Spacer(flex: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                booking.restaurantName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(booking.location, style: TextStyle(color: Colors.grey)),
                  AppIcons.location,
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/booking.jpg',
                width: 70,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
