// ignore_for_file: constant_identifier_names

import 'package:crunchshop/animations/tap_effect.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.padding,
      this.shape,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  final ButtonPadding? padding;

  final ButtonShape? shape;

  final ButtonVariant? variant;

  final ButtonFontStyle? fontStyle;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final String? text;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TapEffect(
        onClick: onTap ?? () {},
        child: TextButton(
          onPressed: onTap,
          style: _buildTextButtonStyle(),
          child: _buildButtonWithOrWithoutIcon(),
        ),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? const SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? const SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.paddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.paddingAll1:
        return getPadding(
          all: 1,
        );
      default:
        return getPadding(
          all: 10,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillGreen800:
        return AppColors.green800;
      case ButtonVariant.FillAmber700:
        return AppColors.amber700;
      default:
        return AppTheme.primaryColor;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder19:
        return BorderRadius.circular(
          getHorizontalSize(
            19.00,
          ),
        );
      case ButtonShape.CircleBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.Bold16:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.Regular19:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: getFontSize(
            19,
          ),
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SemiBold16:
        return TextStyle(
          color: AppColors.black900,
          fontSize: getFontSize(
            16,
          ),
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SemiBold16WhiteA700:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonPadding {
  paddingAll16,
  paddingAll8,
  paddingAll1,
}

enum ButtonShape {
  Square,
  CircleBorder19,
  RoundedBorder8,
  CircleBorder25,
}

enum ButtonVariant {
  FillPrimaryColor,
  FillGreen800,
  FillAmber700,
}

enum ButtonFontStyle {
  Bold18,
  Bold16,
  Regular19,
  SemiBold16,
  SemiBold16WhiteA700,
}
