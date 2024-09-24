import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class LogoTitleSubtitle extends StatelessWidget {
  const LogoTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          svgPath: LocalFiles.crunchShopIcon,
          height: getVerticalSize(101),
          width: getHorizontalSize(89),
          margin: getMargin(top: 37),
        ),
        Padding(
          padding: getPadding(top: 29),
          child: HeadingText26(title: title),
        ),
        Padding(
          padding: getPadding(top: 9),
          child: Text18BoldGrey(
            title: subtitle,
          ),
        ),
      ],
    );
  }
}
