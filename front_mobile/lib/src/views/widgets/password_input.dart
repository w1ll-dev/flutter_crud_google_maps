import 'package:flutter/material.dart';
import 'package:front_mobile/src/controllers/login_controller.dart';
import 'package:get_it/get_it.dart';

class PasswordInput extends StatelessWidget {
  final _loginController = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) {
        _loginController.setPassword(
          newPassword: text,
        );
      },
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      validator: (name) {
        if (name == "") return "Password is empty.";
        return null;
      },
    );
  }
}
