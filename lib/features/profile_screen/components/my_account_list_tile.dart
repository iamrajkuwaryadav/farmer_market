import 'package:crunchshop/core/utils/size_utils.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:flutter/material.dart';

class MyAccountListTile extends StatelessWidget {
  const MyAccountListTile({
    super.key,
    required this.title,
    required this.leadingWidget,
  });

  final String title;
  final Widget leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: getPadding(left: 30, top: 25, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18Bold(title: title),
              leadingWidget,
            ],
          ),
        ),
        Padding(
          padding: getPadding(top: 15),
          child: DividerWidget(
            indent: getHorizontalSize(30),
            endIndent: getHorizontalSize(30),
          ),
        ),
      ],
    );
  }
}
