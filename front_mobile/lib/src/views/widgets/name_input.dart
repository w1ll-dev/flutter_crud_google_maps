import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  final GlobalKey<FormState> nameKey;
  NameInput({this.nameController, this.nameKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: nameKey,
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(),
        ),
        validator: (name) {
          if (name == "") return "Name is empty.";
          if (name.length < 4) return "name must be longer than 3 characters";
          return null;
        },
      ),
    );
  }
}
