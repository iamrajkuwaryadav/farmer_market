import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TextSemiBold20Primary extends StatelessWidget {
  const TextSemiBold20Primary({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: AppTheme.primaryColor,
        fontSize: getFontSize(20),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
