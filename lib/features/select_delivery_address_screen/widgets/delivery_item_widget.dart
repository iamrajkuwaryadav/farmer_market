import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeliveryItemWidget extends StatelessWidget {
  const DeliveryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 19,
          right: 16,
          bottom: 19,
        ),
        decoration: AppDecoration.outlineGray,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtBold16Black900,
            ),
            Container(
              width: getHorizontalSize(
                139,
              ),
              margin: getMargin(
                top: 17,
              ),
              child: Text(
                "",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtMedium16Black900,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 1,
                top: 15,
                bottom: 4,
              ),
              child: Text(
                "865-5585 57587",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtMedium16Black900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
