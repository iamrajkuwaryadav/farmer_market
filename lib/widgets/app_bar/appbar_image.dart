import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage({
    super.key,
    required this.height,
    required this.width,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  });

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: getSize(60),
        height: getSize(60),
        child: Center(
          child: CustomImageView(
            svgPath: svgPath,
            imagePath: imagePath,
            height: height,
            width: width,
            fit: BoxFit.contain,
            color: AppTheme.backIconColor,
          ),
        ),
      ),
    );
  }
}
