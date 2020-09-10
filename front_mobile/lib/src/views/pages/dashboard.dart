import 'package:flutter/material.dart';
import 'package:front_mobile/src/views/widgets/establishments_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Establishments'),
      ),
      body: EstablishmentsList(),
    );
  }
}
