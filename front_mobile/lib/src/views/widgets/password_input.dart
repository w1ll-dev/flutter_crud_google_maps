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
