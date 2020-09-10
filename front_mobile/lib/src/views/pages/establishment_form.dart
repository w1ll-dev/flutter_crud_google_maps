import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/establishments_controller.dart';
import 'package:front_mobile/src/models/establishment_model.dart';
import 'package:get_it/get_it.dart';

class EstablishmentForm extends StatelessWidget {
  final Establishment establishment;
  EstablishmentForm({this.establishment});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final establishmentsController = GetIt.I.get<EstablishmentsController>();

  @override
  Widget build(BuildContext context) {
    _nameController.text = establishment.name;
    _latController.text = establishment.lat.toString();
    _lngController.text = establishment.lng.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Form User"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
