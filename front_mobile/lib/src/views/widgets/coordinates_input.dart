import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CoordinatesInput extends StatelessWidget {
  final TextEditingController latController;
  final GlobalKey<FormState> latKey;
  final TextEditingController lngController;
  final GlobalKey<FormState> lngKey;

  CoordinatesInput({
    this.latController,
    this.latKey,
    this.lngController,
    this.lngKey,
  });

  String validator({String coordinate, String field}) {
    bool containsLetter = coordinate.contains(new RegExp(r'[a-z]')) ||
        coordinate.contains(new RegExp(r'[A-Z]'));
    if (coordinate == "") return "$field is empty.";
    if (containsLetter) return "$field contains letter.";
    if (containsLetter) return "$field contains letter.";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              return Form(
                key: latKey,
                child: TextFormField(
                  controller: latController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Latitude",
                    border: OutlineInputBorder(),
                  ),
                  validator: (coordinate) => validator(
                    coordinate: coordinate,
                    field: 'Latitude',
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return Form(
                key: lngKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: lngController,
                  decoration: InputDecoration(
                    labelText: "Longitude",
                    border: OutlineInputBorder(),
                  ),
                  validator: (coordinate) => validator(
                    coordinate: coordinate,
                    field: 'Longitude',
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
