import 'package:flutter/material.dart';
import 'package:seewe/widget/background_painter.dart';
import 'package:seewe/widget/google_login_button.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: BackgroundPainter()),
        buildSignUp(),
      ],
    ),
  );

  Widget buildSignUp() => Column(
    children: [
      Spacer(),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 175,
          child: Text(
            'Welcome to SeeWe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Spacer(),
      GoogleLoginButtonWidget(),
      SizedBox(height: 12),
      Text(
        'Login to continue',
        style: TextStyle(fontSize: 16),
      ),
      Spacer(),
    ],
  );
}
