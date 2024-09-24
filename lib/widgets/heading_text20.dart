import 'package:crunchshop/core/themes/themes.dart';
import 'package:flutter/material.dart';

class HeadingText20 extends StatelessWidget {
  const HeadingText20({
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
            fontSize: 20,
            color: AppTheme.primaryTextColor,
          ),
    );
  }
}
