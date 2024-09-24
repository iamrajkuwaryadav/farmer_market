import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class AddressBoxWidget extends StatelessWidget {
  const AddressBoxWidget({
    super.key,
    required this.addressModel,
    required this.onTapEditIcon,
    this.widthPercentage = 0.45,
    this.isAllowedEdit = true,
  });

  final AddressModel addressModel;
  final VoidCallback onTapEditIcon;
  final double widthPercentage;
  final bool isAllowedEdit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapEditIcon,
      child: Container(
        width: MediaQuery.of(context).size.width * widthPercentage,
        padding: getPadding(left: 15, top: 15, right: 15),
        decoration: AppDecoration.outlineGray,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(top: 3),
                  child: Positioned(
                    left: 0,
                    right: 0,
                    child: Text18Bold(
                      title: addressModel.fullName,
                    ),
                  ),
                ),
                Container(
                  //width: getHorizontalSize(168),
                  margin: getMargin(top: 15),
                  child: Text16Regular(
                    title:
                        "${addressModel.addressLine1}\n${addressModel.addressLine2}, ${addressModel.city}, ${addressModel.postalCode}\n${addressModel.country}",
                  ),
                ),
                Padding(
                  padding: getPadding(top: 15, bottom: 10),
                  child: Text18Bold(
                    title: addressModel.phoneNumber,
                  ),
                )
              ],
            ),
            if (isAllowedEdit)
              Positioned(
                right: 0,
                child: CustomImageView(
                  svgPath: LocalFiles.imgOffer,
                  height: getSize(15),
                  width: getSize(15),
                  margin: getMargin(left: 32, top: 3, bottom: 4),
                  onTap: onTapEditIcon,
                ),
              )
          ],
        ),
      ),
    );
  }
}
