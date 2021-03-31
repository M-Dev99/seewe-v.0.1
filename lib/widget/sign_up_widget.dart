import 'package:flutter/material.dart';
import 'background_painter.dart';
import 'google_login_button.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: BackgroundPainter(),
        ),
        buildSignUp(),
      ],
    );
  }

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
          SizedBox(
            height: 12,
          ),
          Text(
            "Login to Continue",
            style: TextStyle(fontSize: 16),
          ),
          Spacer()
        ],
      );
}
