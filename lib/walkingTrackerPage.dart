import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class WalkingTrackerPage extends StatefulWidget {
  const WalkingTrackerPage({super.key});

  @override
  _WalkingTrackerPageState createState() => _WalkingTrackerPageState();
}

class _WalkingTrackerPageState extends State<WalkingTrackerPage> {
  late GoogleMapController mapController;
  Location location = Location();
  List<LatLng> routeCoordinates = [];
  Set<Polyline> polylines = {};
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();

    location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        final latLng = LatLng(locationData.latitude!, locationData.longitude!);
        currentLocation = latLng;
        routeCoordinates.add(latLng);
        polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          color: Colors.blue,
          points: routeCoordinates,
        ));
        mapController.animateCamera(CameraUpdate.newLatLng(latLng));
      });
    });

    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final status = await location.requestService();
      if (status != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location service is not enabled.',style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
          ),
        );
        return;
      }
    }

    final permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      final newPermissionStatus = await location.requestPermission();
      if (newPermissionStatus != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permission is denied.', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walking Tracker', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(0.0, 0.0), // Initialize with an empty map
          zoom: 15.0,
        ),
        polylines: polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Location recorded at ${currentLocation!.latitude}, ${currentLocation!.longitude}'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No location data available.', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
              ),
            );
          }
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
