import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final double paddingAroundImage;

  const ProfileImage({super.key, 
    required this.imagePath,
    this.width = 55,
    this.height = 55,
    this.paddingAroundImage = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(117, 67, 155, 0.54), // Color with opacity
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(paddingAroundImage),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: width - (paddingAroundImage * 2),
          height: height - (paddingAroundImage * 2),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
