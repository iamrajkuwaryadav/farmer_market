import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: AppTheme.borderColor,
          width: getHorizontalSize(
            1,
          ),
        ),
      );

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: AppColors.whiteA700,
      );

  static BoxDecoration get outlineGray300 => BoxDecoration(
        border: Border.all(
          color: AppColors.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
}
