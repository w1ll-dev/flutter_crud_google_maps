import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final GlobalKey<FormState> passwordKey;
  PasswordInput({this.passwordController, this.passwordKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: passwordKey,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(),
        ),
        validator: (name) {
          if (name == "") return "Password is empty.";
          return null;
        },
      ),
    );
  }
}
