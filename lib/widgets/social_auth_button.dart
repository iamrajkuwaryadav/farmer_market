import 'package:crunchshop/animations/tap_effect.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onTap,
      child: Container(
        margin: getMargin(top: 63),
        padding: getPadding(left: 38, top: 14, right: 38, bottom: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: image,
              height: getSize(25),
              width: getSize(25),
            ),
            Padding(
              padding: getPadding(left: 10, top: 4),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontSize: getFontSize(
                    16,
                  ),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
