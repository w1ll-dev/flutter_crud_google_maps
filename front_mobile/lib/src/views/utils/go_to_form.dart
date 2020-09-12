import 'package:flutter/material.dart';
import '../pages/establishment_form.dart';

void gotToEstablishmentForm({
  BuildContext context,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EstablishmentForm(),
    ),
  );
}
