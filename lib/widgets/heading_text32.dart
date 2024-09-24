import 'package:crunchshop/core/themes/themes.dart';
import 'package:flutter/material.dart';

class HeadingText32 extends StatelessWidget {
  const HeadingText32({
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
            fontSize: 32,
            color: AppTheme.primaryTextColor,
          ),
    );
  }
}
