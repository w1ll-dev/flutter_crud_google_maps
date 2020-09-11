import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/login_controller.dart';

class UserNameInput extends StatelessWidget {
  final _loginController = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) {
        _loginController.setName(
          newName: text,
        );
      },
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(),
      ),
      validator: (name) {
        if (name == "") return "user name is empty.";
        if (name.length < 4) return "name must be longer than 3 characters";
        return null;
      },
    );
  }
}
