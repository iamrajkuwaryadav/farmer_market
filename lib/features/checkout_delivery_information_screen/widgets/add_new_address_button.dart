import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/add_edit_address_screen/add_edit_address_screen.dart';
import 'package:flutter/material.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddEditAddressScreen(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        margin: getMargin(left: 20),
        //padding: getPadding(left: 27, top: 31, right: 27, bottom: 31),
        height: 135,
        decoration: AppDecoration.outlineGray,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("+", style: AppStyle.txtExtraLight48),
              Container(
                width: getHorizontalSize(65),
                margin: getMargin(bottom: 18),
                child: Text18Grey(
                  title: Loc.alized.lbl_add_address,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
