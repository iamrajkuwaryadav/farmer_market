import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/category_products/category_products.dart';
import 'package:flutter/material.dart';

class CategoryIconItem extends StatelessWidget {
  const CategoryIconItem({
    super.key,
    required this.categoryTitle,
    required this.iconPath,
  });

  final String categoryTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(right: 30),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryProducts(
                categoryTitle: categoryTitle,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconButton(
              height: 70,
              width: 70,
              variant: IconButtonVariant.OutlineGray300,
              padding: IconButtonPadding.PaddingAll14,
              child: CustomImageView(
                svgPath: iconPath,
                color: AppTheme.primaryColor,
              ),
            ),
            Padding(
              padding: getPadding(top: 9),
              child: Text16SemiBold(
                title: categoryTitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
