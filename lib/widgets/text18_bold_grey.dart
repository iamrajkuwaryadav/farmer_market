import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class Text18BoldGrey extends StatelessWidget {
  const Text18BoldGrey({
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
        color: AppColors.gray500,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
