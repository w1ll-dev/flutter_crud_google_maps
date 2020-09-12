import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_mobile/src/controllers/login_controller.dart';
import 'package:get_it/get_it.dart';

class PasswordInput extends StatelessWidget {
  final _loginController = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        print(_loginController.validUser);
        return TextFormField(
          onChanged: (text) {
            _loginController.setPassword(
              newPassword: text,
            );
          },
          onFieldSubmitted: (value) async => _loginController.tryLogin(),
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
            errorText: _loginController.validUser ? null : 'Invalid Password',
          ),
          validator: (name) {
            if (_loginController.validUser == false)
              return "Password is empty.";
            return null;
          },
        );
      },
    );
  }
}
