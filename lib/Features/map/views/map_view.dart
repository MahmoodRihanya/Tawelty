import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:tawelty_app/Features/auth/helper/show_snack_par.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/Features/map/services/handle_location_permission.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

class MapView extends StatefulWidget {
  static final String ID = 'MapView';
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController mapController = MapController();
  LatLng? currentLatLng;
  String locality = '';

  @override
  void initState() {
    super.initState();
    determinePositionAndAddress();
  }

  Future<void> determinePositionAndAddress() async {
    bool hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      showSnackBar(context, 'يرجى تفعيل صلاحية الموقع من الإعدادات');
      return;
    }

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentUserLat = pos.latitude;
    currentUserLng = pos.longitude;

    List<Placemark> places = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
    );

    final place = places.first;
    final province = place.administrativeArea ?? '';
    final district =
        place.subAdministrativeArea?.isNotEmpty == true
            ? place.subAdministrativeArea!
            : (place.locality ?? '');

    setState(() {
      currentLatLng = LatLng(pos.latitude, pos.longitude);
      currentUserCity = district;
      locality = '$province، $district';
      mapController.move(currentLatLng!, 17);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(center: LatLng(0, 0), zoom: 4.0),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
                  subdomains: const ['a', 'b', 'c', 'd'],
                ),
                if (currentLatLng != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80,
                        height: 80,
                        point: currentLatLng!,
                        builder: (ctx) => AppIcons.location,
                      ),
                    ],
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.search, color: kgreyColor),
                      ),
                      Expanded(
                        child: Text(
                          locality.isEmpty ? 'جار تحديد موقعك' : locality,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: AppIcons.location,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    currentUserLocality = locality;
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeView.ID,
                      (r) => false,
                    );
                  },
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppIcons.previous,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
