import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/helper/show_snack_par.dart';
import 'package:tawelty_app/Features/bookings/models/booking_model.dart';
import 'package:tawelty_app/Features/bookings/widgets/booking_card.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/Features/explore/views/loading.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_search_bar.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class AllBookingsView extends StatelessWidget {
  AllBookingsView({super.key});

  static final String ID = 'AllBookingsView';

  @override
  Widget build(BuildContext context) {
    CollectionReference bookings = FirebaseFirestore.instance.collection(
      'bookings',
    );
    return StreamBuilder(
      stream: bookings.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<BookingModel> bookingsList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            final doc = snapshot.data!.docs[i];
            bookingsList.add(BookingModel.fromDocument(doc));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kbackgroundColor,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentUserLocality == ''
                        ? 'اذهب الى الخريطة لتحديد موقعك'
                        : '$currentUserLocality',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  AppIcons.location,
                ],
              ),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.language, color: kgreyColor, size: 32),
              ),
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.ID,
                  (Route<dynamic> route) => false,
                );
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor: kprimaryColor,
                child: Icon(Icons.add, color: Colors.white, size: 35),
              ),
            ),
            backgroundColor: kbackgroundColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36),
                    child: CustomSearchBar(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bookingsList.length,
                      itemBuilder: (context, index) {
                        if (bookingsList[index].id == currentUserId) {
                          return BookingCard(
                            booking: bookingsList[index],
                            onPressed: () async {
                              try {
                                await FirebaseFirestore.instance
                                    .collection('bookings')
                                    .doc(bookingsList[index].docid)
                                    .delete();
                                showSnackBar(context, 'تم الحذف بنجاح');
                              } catch (e) {
                                showSnackBar(context, 'فشل الحذف');
                              }
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar(),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
