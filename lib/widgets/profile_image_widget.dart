import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.imagePath,
    required this.iconPath,
    required this.onTap,
  });

  final String imagePath;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(150),
      width: getHorizontalSize(157),
      margin: getMargin(top: 40),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: CustomImageView(
              imagePath: imagePath,
              height: getSize(150),
              width: getSize(150),
              radius: BorderRadius.circular(getHorizontalSize(75)),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 10,
            right: 5,
            child: CustomIconButton(
              height: 40,
              width: 40,
              margin: getMargin(top: 7),
              variant: IconButtonVariant.OutlineWhiteA700,
              shape: IconButtonShape.RoundedBorder22,
              padding: IconButtonPadding.PaddingAll14,
              alignment: Alignment.topRight,
              onTap: onTap,
            ),
          ),
          Positioned(
            top: 27,
            right: 15,
            child: CustomImageView(
              svgPath: iconPath,
              height: getSize(15),
              width: getSize(15),
              radius: BorderRadius.circular(getHorizontalSize(75)),
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
