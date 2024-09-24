import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class Text18BoldPrimary extends StatelessWidget {
  const Text18BoldPrimary({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: AppTheme.primaryColor,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
