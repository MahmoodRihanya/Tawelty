import 'package:flutter/material.dart';

final Color kprimaryColor = Color(0xffFF7143);
final Color kgreyColor = Colors.grey;
final Color kbackgroundColor = Color(0xffF6F5F5);
const String birthday = 'birthday';
const String romanticDinner = 'romanticDinner';
const String businessMeeting = 'businessMeeting';
const String familyDinner = 'familyDinner';
const String italiaFood = 'italisfood';
const String asiaFood = 'asiaFood';
const String fastFood = 'fastFood';
const String rating = 'rating';
const String update = 'update';
const String special = 'special';

// if request return null show this image
final String image =
    'https://images.unsplash.com/photo-1651978595438-980213ca6d3d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3NzY5NTh8MHwxfHNlYXJjaHwxfHxyZXN0YXVyYW50JTIwcGl6emF8ZW58MHx8fHwxNzUyMjU3NzQzfDA&ixlib=rb-4.1.0&q=80&w=1080';

//this class for icons I always use it in app
class AppIcons {
  static final Icon previous = Icon(Icons.east, color: kprimaryColor);
  static final Icon location = Icon(
    Icons.location_on_sharp,
    color: kprimaryColor,
  );
  static final Icon birthday = Icon(Icons.cake, color: kprimaryColor, size: 40);
  static final Icon romanticDinner = Icon(
    Icons.volunteer_activism,
    color: kprimaryColor,
    size: 40,
  );
  static final Icon businessMeeting = Icon(
    Icons.business_center,
    color: kprimaryColor,
    size: 40,
  );
  static final Icon familyDinner = Icon(
    Icons.diversity_1,
    color: kprimaryColor,
    size: 40,
  );
}

//this for 'TableCalendar'
final Map arabicWeekdays = {
  DateTime.sunday: 'الأحد',
  DateTime.monday: 'الإثنين',
  DateTime.tuesday: 'الثلاثاء',
  DateTime.wednesday: 'الأربعاء',
  DateTime.thursday: 'الخميس',
  DateTime.friday: 'الجمعة',
  DateTime.saturday: 'السبت',
};
