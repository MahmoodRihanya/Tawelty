import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String docid;
  String id;
  String location;
  String restaurantName;
  String day;
  String month;

  BookingModel({
    required this.id,
    required this.restaurantName,
    required this.location,
    required this.month,
    required this.day,
    required this.docid,
  });

  factory BookingModel.fromDocument(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookingModel(
      docid: doc.id,
      id: data['ID'],
      restaurantName: data['restaurant name'],
      location: data['restaurant location'],
      month: data['month'],
      day: data['day'],
    );
  }
}
