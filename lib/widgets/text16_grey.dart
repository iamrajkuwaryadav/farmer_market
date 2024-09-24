import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class Text16Grey extends StatelessWidget {
  const Text16Grey({
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
          16,
        ),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
