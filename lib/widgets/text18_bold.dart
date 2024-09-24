import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class Text18Bold extends StatelessWidget {
  const Text18Bold({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: getFontSize(18),
            color: AppTheme.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
