import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';

class Gio extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Gio> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(33.579784, -7.620114);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {};
  @override
  void initState() {
    _markers.clear();
    _markers.add(Marker(
      markerId: MarkerId(_center.toString()),
      position: _center,
      infoWindow: InfoWindow(
        title: 'Emsi centre',
        snippet: 'casa',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
          markers: _markers,
        ),
        

        
      ]),


      
    );
  }
}
