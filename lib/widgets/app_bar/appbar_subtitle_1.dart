import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarSubtitle1 extends StatelessWidget {
  AppbarSubtitle1({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
  });

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: getFontSize(22),
                color: AppTheme.primaryTextColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
