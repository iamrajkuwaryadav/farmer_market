import 'package:crunchshop/core/themes/themes.dart';
import 'package:flutter/material.dart';

class HeadingText26 extends StatelessWidget {
  const HeadingText26({
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
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 26,
            color: AppTheme.primaryTextColor,
          ),
    );
  }
}
