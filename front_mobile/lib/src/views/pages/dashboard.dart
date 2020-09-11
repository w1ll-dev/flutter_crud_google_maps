import 'package:flutter/material.dart';
import 'package:front_mobile/src/views/utils/go_to_form.dart';
import 'package:front_mobile/src/views/widgets/establishments_list.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/establishment_form_controller.dart';

class Dashboard extends StatelessWidget {
  final _establishmentsFormController =
      GetIt.I.get<EstablishmentFormController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Establishments'),
      ),
      body: EstablishmentsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          _establishmentsFormController.createNewEstablishment(),
          gotToEstablishmentForm(context: context)
        },
      ),
    );
  }
}
