import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../models/establishment_model.dart';
import '../utils/go_to_form.dart';
import '../../controllers/establishment_form_controller.dart';
import '../../controllers/establishments_controller.dart';

class EstablishmentsTile extends StatelessWidget {
  final Establishment establishment;
  final _establishmentsController = GetIt.I.get<EstablishmentsController>();
  final _establishmentsFormController =
      GetIt.I.get<EstablishmentFormController>();
  EstablishmentsTile({
    @required this.establishment,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.map),
      title: Text("${establishment.name}"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "lat:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${establishment.lat}"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "lng:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${establishment.lng}")
            ],
          )
        ],
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
              onPressed: () => {
                _establishmentsFormController.updateStablishment(
                  newEstablishment: establishment,
                ),
                gotToEstablishmentForm(context: context),
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () async {
                await _establishmentsController.delete(id: establishment.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
