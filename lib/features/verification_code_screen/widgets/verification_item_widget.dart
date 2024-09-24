import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerificationItemWidget extends StatelessWidget {
  VerificationItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtBold24,
        ),
        Text(
          "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtBold24,
        ),
        Text(
          "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtBold24,
        ),
      ],
    );
  }
}
