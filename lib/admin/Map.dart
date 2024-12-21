import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';  // Make sure this import exists
import '../constants/AppBar Texts.dart';

// Changed class name from GoogleMap to GoogleMapScreen to avoid conflict
class GoogleMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String userName;

  const GoogleMapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.userName,
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: LatLng(widget.latitude, widget.longitude),
        infoWindow: InfoWindow(title: widget.userName),
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

            // AppBar
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
                appbarText("Location", width / 14.84),
                Container(
                  width: width / 5.50,
                  height: height / 20.45,
                ),
              ],
            ),

            // Map Container
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width / 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      // Changed from GoogleMap to GoogleMap widget from google_maps_flutter
                      Container(
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(widget.latitude, widget.longitude),
                            zoom: 15,
                          ),
                          markers: markers,
                          onMapCreated: (GoogleMapController controller) {
                            setState(() {
                              mapController = controller;
                            });
                          },
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          zoomControlsEnabled: true,
                          mapType: MapType.normal,
                        ),
                      ),

                      // Location Details Card
                      // Positioned(
                      //   bottom: 16,
                      //   left: 16,
                      //   right: 16,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.white.withOpacity(0.9),
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     padding: const EdgeInsets.all(16),
                      //     child: Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Text(
                      //           widget.userName,
                      //           style: TextStyle(
                      //             fontSize: width / 20,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         SizedBox(height: height / 80),
                      //         Text(
                      //           'latitude: ${widget.latitude.toStringAsFixed(4)}',
                      //           style: TextStyle(
                      //             fontSize: width / 25,
                      //             color: Colors.black87,
                      //           ),
                      //         ),
                      //         Text(
                      //           'longitude: ${widget.longitude.toStringAsFixed(4)}',
                      //           style: TextStyle(
                      //             fontSize: width / 25,
                      //             color: Colors.black87,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
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
