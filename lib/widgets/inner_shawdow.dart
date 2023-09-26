import 'package:flutter/material.dart';

class InnerShadowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63.68214,
      height: 71.12638,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 10.0, // Spread radius
            offset: Offset(0, 0), // Offset in both X and Y direction (0,0 for inner shadow)
          ),
        ],
      ),
      child: ClipRect(
        child: Stack(
          children: [
            Container(
              width: 63.68214,
              height: 71.12638,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('PATH_TO_IMAGE'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
