import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderItemImageWidget extends StatelessWidget {
  const SliderItemImageWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: imagePath,
        height: getVerticalSize(
          240,
        ),
        width: getHorizontalSize(
          268,
        ),
      ),
    );
  }
}
