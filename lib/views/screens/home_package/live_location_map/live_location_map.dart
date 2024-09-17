

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class LiveLocationMap extends StatefulWidget {
  const LiveLocationMap({super.key});

  @override
  State<LiveLocationMap> createState() => _LiveLocationMapState();
}

class _LiveLocationMapState extends State<LiveLocationMap> {

  GoogleMapController? _mapController;
  Position? _currentPosition;
  late BitmapDescriptor _customIcon;
  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // Initial position (San Francisco)

  @override
  void initState() {
    super.initState();
    _setCustomIcon();
    _startLocationTracking();
  }

  void _setCustomIcon() async {
    _customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), 'assets/images/turbotechlogo.png',
    );
  }

  void _startLocationTracking() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Start listening to location updates
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentPosition = position;
        _mapController?.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(position.latitude, position.longitude),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location Tracking'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _currentPosition == null
            ? {}
            : {
          Marker(
            markerId: MarkerId('current_location'),
            position: LatLng(
              _currentPosition!.latitude,
              _currentPosition!.longitude,
            ),
            icon: _customIcon, // Custom marker icon
          ),
        },
        myLocationEnabled: true, // Show default blue dot
        myLocationButtonEnabled: true, // Show default location button
      ),
    );
  }
}
