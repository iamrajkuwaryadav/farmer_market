import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class Text16RegularPrimary extends StatelessWidget {
  const Text16RegularPrimary({
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
        fontSize: getFontSize(16),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
