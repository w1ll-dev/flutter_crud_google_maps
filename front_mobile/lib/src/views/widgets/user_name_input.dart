import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/login_controller.dart';

class UserNameInput extends StatelessWidget {
  final _loginController = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFormField(
          autofocus: true,
          onChanged: (text) {
            _loginController.setName(
              newName: text,
            );
          },
          decoration: InputDecoration(
            errorText: _loginController.validUser ? null : 'Invalid Username',
            prefixIcon: Icon(
              Icons.supervised_user_circle,
              color: _loginController.validUser == false
                  ? Colors.red
                  : Colors.green,
            ),
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
          validator: (name) {
            if (name == "") return "user name is empty.";
            if (name.length < 4) return "name must be longer than 3 characters";
            if (_loginController.validUser == false) return "invalid username";
            return null;
          },
        );
      },
    );
  }
}
