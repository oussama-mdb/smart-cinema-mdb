import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class TotoGPS extends StatefulWidget {


  @override
  _TotoGPSState createState() => _TotoGPSState();
}

class _TotoGPSState extends State<TotoGPS> {

  final Map1 geo= Map1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<Position>(
        stream: geo.getCurrentLocation(),
        builder: (context,snapchot){
          return Center(
            child: Text("Lat:${snapchot.data.latitude},Lang${snapchot.data.longitude}"),
          );
        },
      )
    );
  }
}
