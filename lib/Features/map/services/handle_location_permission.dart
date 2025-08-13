import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }
  }
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}
