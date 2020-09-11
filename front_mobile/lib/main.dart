import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/establishment_form_controller.dart';
import 'package:front_mobile/src/controllers/establishments_controller.dart';
import 'package:get_it/get_it.dart';

import 'src/views/pages/dashboard.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<EstablishmentsController>(EstablishmentsController());
  getIt.registerSingleton<EstablishmentFormController>(
      EstablishmentFormController());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Front Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
