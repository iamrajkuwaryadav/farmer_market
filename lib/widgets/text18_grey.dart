import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class Text18Grey extends StatelessWidget {
  const Text18Grey({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.gray500,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
