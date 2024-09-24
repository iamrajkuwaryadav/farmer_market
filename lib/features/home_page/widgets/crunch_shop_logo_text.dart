import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class CrunchShopLogoText extends StatelessWidget {
  const CrunchShopLogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Crunch",
            style: TextStyle(
              color: AppColors.deepOrangeA400,
              fontSize: getFontSize(28),
              fontFamily: 'Be Vietnam Pro',
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: "Shop",
            style: TextStyle(
              color: AppTheme.primaryTextColor,
              fontSize: getFontSize(28),
              fontFamily: 'Be Vietnam Pro',
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
