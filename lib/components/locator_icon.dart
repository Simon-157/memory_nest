import 'package:flutter/material.dart';

class CustomLocator extends StatelessWidget {
  const CustomLocator({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0, // Convert degrees to radians
      child: Container(
        width: 63.68214,
        height: 71.12638,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('locator.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
