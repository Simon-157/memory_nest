
import 'package:flutter/material.dart';
import 'package:memory_nest/utils/color_pallete.dart';

class GradientOverlayContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const GradientOverlayContainer({super.key, 
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(136, 64, 130, 0.50),
            Color.fromRGBO(110, 63, 204, 0.3),
            Color.fromRGBO(140, 33, 193, 0.3),
          ],
          stops: [-0.3,0.4, 0.6],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: CustomColor.secondaryColor),
      ),
    );
  }
}
