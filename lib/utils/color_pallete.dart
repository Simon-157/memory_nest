import 'package:flutter/material.dart';

class CustomColor {
  // Solid colors
  static const Color primaryColor = Color(0xFF00A3E1);
  static const Color secondaryColor = Color(0xFF7F8FA4);

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF180D41),
      Color(0xFF350D53),
      Color(0xFF190E43),
      Color(0xFF130736),
    ],
    stops: [0, 0.2968, 0.5565, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.repeated,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment(0.0, -2.49),
    end: Alignment(1.0, 0.8777),
    colors: [
      Color.fromRGBO(136, 64, 130, 0.50),
      Color.fromRGBO(30, 24, 84, 0.50),
    ],
    stops: [-0.0249, 0.8777],
  );
}
// rgba(255, 245, 0, 1), rgba(241, 28, 74, 1), rgba(122, 12, 252, 1), rgba(238, 13, 30, 1)