import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller = Completer();

  Map<String, Marker> _markers ={};

  static const CameraPosition initialPosition =
  CameraPosition(target: LatLng(16.0723962, 108.1960358), zoom: 14.0);

  //currentLocation
  LatLng currentLocation = LatLng(16.0723962, 108.1960358);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text("Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          addMarker("someId", currentLocation); // Thêm "someId" hoặc một giá trị id khác ở đây
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addMarker(String id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
    );

    _markers[id] = marker;
    setState(() {});
  }
}
