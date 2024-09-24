import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const CircularImage({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
