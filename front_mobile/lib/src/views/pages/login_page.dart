import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/establishments_controller.dart';

class LoginPage extends StatelessWidget {
  final EstablishmentsController establishmentsController =
      EstablishmentsController();
  @override
  Widget build(BuildContext context) {
    establishmentsController.getList();
    return Scaffold(
      body: Center(
        child: Text(
          'login',
        ),
      ),
    );
  }
}
