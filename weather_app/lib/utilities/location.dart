import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class Location {
  double lon = 10.0;
  double lat = 10.0;

  Future<void> getCurrentLoc() async {
    final pos = await _determinePosition();
    log(pos.toString());
      lon = pos.longitude;
      lat = pos.latitude;
 
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location is not enabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low)
        .timeout(const Duration(seconds: 10));
  }
}
