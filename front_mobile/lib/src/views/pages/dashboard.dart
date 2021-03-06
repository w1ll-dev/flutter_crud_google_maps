import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/login_controller.dart';
import 'package:front_mobile/src/views/pages/maps_page.dart';
import 'package:front_mobile/src/views/utils/go_to_form.dart';
import 'package:front_mobile/src/views/widgets/establishments_list.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/establishment_form_controller.dart';
import '../pages/login_page.dart';

class Dashboard extends StatelessWidget {
  final _establishmentsFormController =
      GetIt.I.get<EstablishmentFormController>();
  final _loginController = GetIt.I.get<LoginController>();

  Future<bool> _onWillPop({BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Are you sure?'),
            content: Container(
              child: Text('Are you sure you want to go back?'),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => {
                  _loginController.reset(),
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (Route<dynamic> route) => false)
                },
                child: Text('Yes'),
              ),
            ],
          ) ??
          false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context: context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Establishments'),
          actions: [
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MapsPage(),
                ),
              ),
            )
          ],
        ),
        body: EstablishmentsList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            _establishmentsFormController.createNewEstablishment(),
            gotToEstablishmentForm(context: context)
          },
        ),
      ),
    );
  }
}
