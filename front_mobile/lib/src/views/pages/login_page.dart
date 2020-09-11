import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/name_input.dart';
import '../widgets/password_input.dart';
import '../widgets/enter_login_buttom.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: screen.width * 0.8,
                    height: screen.width * 0.8,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NameInput(),
                    SizedBox(
                      height: 30.0,
                    ),
                    PasswordInput(),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
