import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TextSemiBold20 extends StatelessWidget {
  const TextSemiBold20({
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
        color: AppTheme.primaryTextColor,
        fontSize: getFontSize(20),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
