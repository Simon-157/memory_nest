import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<LatLng?> getUserLocation() async {
  final location = Location();
  try {
    final userLocation = await location.getLocation();
    print(userLocation);
    return LatLng(userLocation.latitude ?? 0.0, userLocation.longitude ?? 0.0);
  } catch (e) {
    print("Error getting location: $e");
    return null;
  }
}
