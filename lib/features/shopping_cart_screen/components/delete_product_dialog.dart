import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class DeleteProductDialog extends StatelessWidget {
  const DeleteProductDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(368),
      padding: getPadding(left: 28, top: 30, right: 28, bottom: 30),
      decoration: BoxDecoration(
          color: AppTheme.productCardImageBg,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(10),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            svgPath: LocalFiles.imgLocation,
            height: getVerticalSize(55),
            width: getHorizontalSize(62),
          ),
          Padding(
            padding: getPadding(top: 31),
            child: TextSemiBold20(
              title: Loc.alized.msg_delete_this_product,
            ),
          ),
          Padding(
            padding: getPadding(top: 9),
            child: Text18Grey(title: Loc.alized.msg_are_you_want_to),
          ),
          Padding(
            padding: getPadding(left: 2, top: 40, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(50),
                    text: Loc.alized.lbl_yes,
                    margin: getMargin(right: 10),
                    shape: ButtonShape.CircleBorder25,
                    fontStyle: ButtonFontStyle.Bold16,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(50),
                    text: Loc.alized.lbl_no,
                    margin: getMargin(left: 10),
                    variant: ButtonVariant.FillAmber700,
                    shape: ButtonShape.CircleBorder25,
                    fontStyle: ButtonFontStyle.Bold16,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
