import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../Provider/loginProvider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/bodyContainer.dart';
import '../models/class.dart';

class AllUsersMap extends StatefulWidget {
  const AllUsersMap({super.key});

  @override
  State<AllUsersMap> createState() => _AllUsersMapState();
}

class _AllUsersMapState extends State<AllUsersMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAllUserMarkers();
    });
  }

  void _loadAllUserMarkers() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    markers.clear();

    for (var user in loginProvider.userLocationList) {
      markers.add(
        Marker(
          markerId: MarkerId(user.userId),
          position: LatLng(user.latitude, user.longitude),
          infoWindow: InfoWindow(
            title: user.userNameLo,
            snippet: 'Click for details',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onTap: () {
            showUserDetails(user);
          },
        ),
      );
    }
    setState(() {});

    if (markers.isNotEmpty) {
      fitAllMarkers();
    }
  }

  void fitAllMarkers() {
    if (mapController == null || markers.isEmpty) return;

    double minLat = markers.first.position.latitude;
    double maxLat = markers.first.position.latitude;
    double minLng = markers.first.position.longitude;
    double maxLng = markers.first.position.longitude;

    for (var marker in markers) {
      if (marker.position.latitude < minLat) minLat = marker.position.latitude;
      if (marker.position.latitude > maxLat) maxLat = marker.position.latitude;
      if (marker.position.longitude < minLng) minLng = marker.position.longitude;
      if (marker.position.longitude > maxLng) maxLng = marker.position.longitude;
    }

    mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat - 0.1, minLng - 0.1),
          northeast: LatLng(maxLat + 0.1, maxLng + 0.1),
        ),
        50,
      ),
    );
  }

  void showUserDetails(GetUserDrtailaClassForLocation user) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.userImageLo),
            ),
            const SizedBox(height: 16),
            Text(
              user.userNameLo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Latitude: ${user.latitude}\nLongitude: ${user.longitude}',
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: bodyContainer(
        height,
        width,
        Column(
          children: [
            SizedBox(height: height / 16.45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width / 23.45),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width / 7.45,
                      height: height / 20.45,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("assets/image/Backarow.png"),
                          scale: 4.20,
                        ),
                      ),
                    ),
                  ),
                ),
                appbarText("All Users Location", width / 14.84),
                Container(
                  width: width / 5.50,
                  height: height / 20.45,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width / 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(10.8505, 76.2711), // Kerala center
                      zoom: 7,
                    ),
                    onMapCreated: (controller) {
                      mapController = controller;
                      _loadAllUserMarkers();
                    },
                    markers: markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}