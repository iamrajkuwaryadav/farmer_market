import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: getVerticalSize(1),
      thickness: getVerticalSize(1),
      color: AppTheme.borderColor,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
