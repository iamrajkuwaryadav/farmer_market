// ignore_for_file: constant_identifier_names

import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case IconButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      default:
        return getPadding(
          all: 20,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA700:
        return AppColors.deepOrangeA400;
      case IconButtonVariant.OutlineGray90001:
        return AppColors.deepOrangeA400;
      case IconButtonVariant.OutlineGray300:
      case IconButtonVariant.OutlineBluegray900:
        return null;
      default:
        return AppColors.deepOrangeA400;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray300:
        return Border.all(
          color: AppTheme.borderColor,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonVariant.OutlineWhiteA700:
        return Border.all(
          color: AppColors.whiteA700,
          width: getHorizontalSize(
            5.00,
          ),
        );
      case IconButtonVariant.OutlineBluegray900:
        return Border.all(
          color: AppColors.blueGray900,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonVariant.OutlineGray90001:
        return Border.all(
          color: AppColors.gray90001,
          width: getHorizontalSize(
            5.00,
          ),
        );
      case IconButtonVariant.FillDeeporangeA400:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder22:
        return BorderRadius.circular(
          getHorizontalSize(
            22.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            35.00,
          ),
        );
    }
  }
}

enum IconButtonShape {
  RoundedBorder22,
  CircleBorder35,
}

enum IconButtonPadding {
  PaddingAll14,
  PaddingAll20,
  PaddingAll11,
}

enum IconButtonVariant {
  FillDeeporangeA400,
  OutlineGray300,
  OutlineWhiteA700,
  OutlineBluegray900,
  OutlineGray90001,
}
