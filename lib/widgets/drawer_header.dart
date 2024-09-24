import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/home_page/widgets/crunch_shop_logo_text.dart';
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });

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
          child: const CrunchShopLogoText(),
        ),
      ],
    );
  }
}
