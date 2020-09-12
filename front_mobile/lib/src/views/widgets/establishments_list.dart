import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_mobile/src/controllers/establishments_controller.dart';
import 'package:front_mobile/src/views/widgets/establishments_tile.dart';
import 'package:get_it/get_it.dart';

class EstablishmentsList extends StatelessWidget {
  final establishmentsController = GetIt.I.get<EstablishmentsController>();
  @override
  Widget build(BuildContext context) {
    establishmentsController.getList();
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: establishmentsController.all.length,
          itemBuilder: (context, index) {
            return EstablishmentsTile(
              establishment: establishmentsController.all[index],
            );
          },
        );
      },
    );
  }
}
