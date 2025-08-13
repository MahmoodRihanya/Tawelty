import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tawelty_app/Features/bookings/views/all_bookings_view.dart';
import 'package:tawelty_app/Features/explore/models/restaurant_model.dart';
import 'package:tawelty_app/Features/onboarding/widgets/custom_button.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class DetailsBookingView extends StatefulWidget {
  DetailsBookingView({super.key, required this.restaurant, required this.id});
  String id;
  RestaurantModel restaurant;
  static final String ID = 'BookingsView';

  @override
  State<DetailsBookingView> createState() => _DetailsBookingViewState();
}

class _DetailsBookingViewState extends State<DetailsBookingView> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference bookings = FirebaseFirestore.instance.collection(
    'bookings',
  );
  DateTime firstDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 4),
                  child: Text(
                    'حدد تاريخاً',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Divider(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    focusedDay: this.focusedDay,
                    firstDay: firstDay,
                    lastDay: DateTime(2030, 12, 30),
                    selectedDayPredicate: (day) {
                      return isSameDay(this.selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        this.selectedDay = selectedDay;
                        this.focusedDay = focusedDay;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.saturday,
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                      selectedBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                      dowBuilder: (context, day) {
                        final label = arabicWeekdays[day.weekday]!;
                        return Center(
                          child: Text(
                            label,
                            style: TextStyle(color: kgreyColor),
                          ),
                        );
                      },
                    ),

                    headerStyle: HeaderStyle(
                      formatButtonShowsNext: false,
                      formatButtonVisible: false,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),

                Spacer(flex: 1),
                CustomButton(
                  ontap: () async {
                    await bookings.add({
                      'restaurant location': '${widget.restaurant.location}',
                      'restaurant name': '${widget.restaurant.name}',
                      'ID': '${widget.id}',
                      'day': '${this.selectedDay.day}',
                      'month': '${this.selectedDay.month}',
                    });
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AllBookingsView.ID,
                      (Route<dynamic> route) => false,
                    );
                  },
                  text: 'تثبيت الحجز',
                  backGroundColor: kprimaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
