import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithRouteAndMarkers extends StatefulWidget {
  final LatLng userLocation;
  final LatLng destinationLocation;

  const GoogleMapWithRouteAndMarkers({
    Key? key,
    required this.userLocation,
    required this.destinationLocation,
  }) : super(key: key);

  @override
  _GoogleMapWithRouteAndMarkersState createState() => _GoogleMapWithRouteAndMarkersState();
}

class _GoogleMapWithRouteAndMarkersState extends State<GoogleMapWithRouteAndMarkers> {
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.userLocation,
        zoom: 12.0,
      ),
      onMapCreated: (controller) {
        setState(() {
          _controller = controller;
        });
      },
      markers: _buildMarkers(),
      polylines: _buildPolylines(),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    // Add a marker for the user's current location
    markers.add(
      Marker(
        markerId: const MarkerId('UserLocation'),
        position: widget.userLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ),
    );

    // Add a marker for the destination location
    markers.add(
      Marker(
        markerId: const MarkerId('DestinationLocation'),
        position: widget.destinationLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'Destination Location'),
      ),
    );

    return markers;
  }


Set<Polyline> _buildPolylines() {
  Set<Polyline> polylines = {};

  // Create a polyline from user's location to destination location with a custom pattern
  polylines.add(
    Polyline(
      polylineId: const PolylineId('Route'),
      points: [widget.userLocation, widget.destinationLocation],
      color: Color.fromARGB(255, 89, 229, 110),
      width: 3,
      patterns: [
        PatternItem.dash(10), // Length of the dash
        PatternItem.gap(10),  // Length of the gap
      ],
    ),
  );

  return polylines;
}


}
