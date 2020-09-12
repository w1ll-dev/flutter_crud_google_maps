import 'package:flutter/material.dart';
import 'package:front_mobile/src/models/establishment_model.dart';
import 'package:front_mobile/src/views/pages/search_places_page.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/establishments_controller.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final _establishmentsController = GetIt.I.get<EstablishmentsController>();
  GoogleMapController _mapController;
  Set<Marker> markers = new Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double indexLat = _establishmentsController.all[0].lat;
    double indexLng = _establishmentsController.all[0].lng;
    setState(() {
      for (Establishment _establishment in _establishmentsController.all) {
        final Marker marker = Marker(
          markerId: new MarkerId(
            '${_establishment.id}',
          ),
          position: LatLng(
            _establishment.lat,
            _establishment.lng,
          ),
          infoWindow: InfoWindow(
            title: _establishment.name,
          ),
        );
        markers.add(marker);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchPlaces(),
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(indexLat, indexLng),
          zoom: 15.0,
        ),
        markers: markers,
      ),
    );
  }
}
