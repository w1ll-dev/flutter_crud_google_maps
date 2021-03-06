import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/establishment_form_controller.dart';
import 'package:front_mobile/src/models/establishment_model.dart';
import 'package:front_mobile/src/views/pages/dashboard.dart';
import '../../controllers/establishments_controller.dart';
import 'package:front_mobile/src/views/widgets/coordinates_input.dart';
import 'package:get_it/get_it.dart';
import '../widgets/establishment_name_input.dart';

class EstablishmentForm extends StatelessWidget {
  final _establishmentsController = GetIt.I.get<EstablishmentsController>();
  final _establishmentsFormController =
      GetIt.I.get<EstablishmentFormController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();

  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _latKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lngKey = GlobalKey<FormState>();

  bool validFields() =>
      _nameKey.currentState.validate() &&
      _latKey.currentState.validate() &&
      _lngKey.currentState.validate();

  @override
  Widget build(BuildContext context) {
    _nameController.text = _establishmentsFormController.name;
    _latController.text = _establishmentsFormController.lat;
    _lngController.text = _establishmentsFormController.lng;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form User"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EstablishmentNameInput(
                      nameController: _nameController,
                      nameKey: _nameKey,
                    ),
                    SizedBox(height: 10),
                    CoordinatesInput(
                      latController: _latController,
                      lngController: _lngController,
                      latKey: _latKey,
                      lngKey: _lngKey,
                    ),
                  ],
                ),
                _establishmentsFormController.isANewEstablishment
                    ? RaisedButton(
                        onPressed: () async => {
                          if (validFields())
                            {
                              await _establishmentsController.create(
                                establishment: Establishment(
                                  name: _nameController.text,
                                  lat: double.parse(_latController.text),
                                  lng: double.parse(_lngController.text),
                                ),
                              ),
                              _establishmentsFormController.clear(),
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(),
                                  ),
                                  (Route<dynamic> route) => false),
                            }
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green[400],
                      )
                    : RaisedButton(
                        onPressed: () async => {
                          await _establishmentsController.update(
                            establishment: Establishment(
                              id: _establishmentsFormController.id,
                              name: _nameController.text,
                              lat: double.parse(_latController.text),
                              lng: double.parse(_lngController.text),
                            ),
                          ),
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          ),
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Colors.yellow[400],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
