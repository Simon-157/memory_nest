import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
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
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(131.82446, 131.82446),
            blurRadius: 219.70744,
            color: Color.fromRGBO(0, 0, 0, 0.30),
          ),
          BoxShadow(
            offset: Offset(0, 60),
            blurRadius: 100,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
    );
  }
}
