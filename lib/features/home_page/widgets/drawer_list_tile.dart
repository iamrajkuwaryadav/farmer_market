import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:flutter/material.dart';

/// Drawer List Tile Widget
class DrawerListTile extends StatelessWidget {
  ///
  const DrawerListTile({
    Key? key,
    required this.onTap,
    required this.iconPath,
    required this.linkTitle,
  }) : super(key: key);

  /// onTap VoidCallback function
  final VoidCallback onTap;

  /// Icon Name
  final String iconPath;

  /// Link Title Text
  final String linkTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.all(10.0),
        child: CustomImageView(svgPath: iconPath, color: Colors.white),
      ),
      title: Text16SemiBold(title: linkTitle),
    );
  }
}
