import 'package:flutter/material.dart';
import 'package:front_mobile/src/views/pages/dashboard.dart';

bool validUser = true;

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _ripleController;
  AnimationController _scaleController;

  Animation<double> _ripleAnimation;
  Animation<double> _scaleAnimation;

  bool _hideIcon = false;
  Color _buttonColor = Colors.green[600];
  Color _defaultColor = Colors.greenAccent;

  @override
  void initState() {
    super.initState();

    _ripleController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _ripleAnimation =
        Tween<double>(begin: 80.0, end: 100.0).animate(_ripleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _ripleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _ripleController.forward();
            }
          });

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              }
            },
          );

    _ripleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ripleController,
      builder: (context, child) => Container(
        width: _ripleAnimation.value,
        height: _ripleAnimation.value,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _defaultColor,
          ),
          child: InkWell(
            onTap: () {
              print(validUser);
              _hideIcon = true;
              _scaleController.forward();
            },
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) => Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  child: Icon(
                    _hideIcon ? null : Icons.keyboard_arrow_right,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _buttonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
