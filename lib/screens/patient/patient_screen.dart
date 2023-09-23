import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memory_nest/components/contact_card.dart';
import 'package:memory_nest/services/map_services/location_servicez.dart';
import 'package:memory_nest/utils/color_pallete.dart';
import 'package:memory_nest/widgets/bottom_nav.dart';
import 'package:memory_nest/widgets/maps/map_widget.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  late LatLng userLocation = LatLng(0.0, 0.0);
  bool isLocationLoading = true;

  late int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final location = await getUserLocation();
    if (location != null) {
      setState(() {
        userLocation = location;
        isLocationLoading = false; // Location has been fetched
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 27, 7, 44),
      //   title: const Text('Map Screen'),
      // ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColor.primaryGradient,
        ),
        child: Column(
          children: [
            // Top Section
            Container(
              height: 100.0,
              // color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'Dramani Bronya, Com 22',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),

            // Middle Section (Map)
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: isLocationLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMapWithRouteAndMarkers(
                          userLocation: userLocation,
                          destinationLocation: const LatLng(5.75765, 0.22118),
                        ),
                ),
              ),
            ),

            // Contact Section

            Container(
              height: 100.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  
                  GradientOverlayContainer(
                    width: 80,
                    height:80,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GradientOverlayContainer(
                    width: 80,
                    height: 80,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GradientOverlayContainer(
                    width: 80,
                    height: 80,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ), 
                  GradientOverlayContainer(
                    width: 80,
                    height: 80,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GradientOverlayContainer(
                    width: 80,
                    height: 80,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),

                  
                ],
              ),
            ),

            // Bottom Section
            Container(
              height: 100.0,
              alignment: Alignment.center,
              child: BottomNav(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavItem(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                  BottomNavItem(
                    icon: Icons.favorite,
                    label: 'Favorites',
                  ),
                  BottomNavItem(
                    icon: Icons.person,
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
