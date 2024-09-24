import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/helpers/star_rating_bar/rating_bar.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartProductItemCard extends StatelessWidget {
  const CartProductItemCard({
    super.key,
    this.onTapRemove,
    required this.productModel,
    this.isTrackOrderScreen = false,
    this.isMyOrderScreen = false,
  });

  final ProductModel productModel;
  final VoidCallback? onTapRemove;
  final bool isTrackOrderScreen;
  final bool isMyOrderScreen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getSize(169),
              width: getSize(169),
              padding: getPadding(all: 20),
              color: AppTheme.productCardImageBg,
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CustomImageView(
                        imagePath: productModel.productImagesList[0],
                        height: getSize(128),
                        width: getSize(128),
                        alignment: Alignment.center,
                      ),
                      if (!isTrackOrderScreen)
                        CustomImageView(
                          svgPath: LocalFiles.imgTrashDeepOrangeA400,
                          height: getSize(20),
                          width: getSize(20),
                          alignment: Alignment.topRight,
                          onTap: () {
                            onTapRemove?.call();
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.only(right: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    onRatingUpdate: (rating) {
                      '$rating'.log();
                    },
                  ),
                  Padding(
                    padding: getPadding(top: 10),
                    child: Text16SemiBold(
                      title: productModel.productTitle,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 15),
                    child: Text16SemiBoldPrimary(
                      title: productModel.price,
                    ),
                  ),
                  if (!isTrackOrderScreen)
                    Padding(
                      padding: getPadding(top: 33),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CartAddRemoveButton(
                            title: '-',
                            onTap: () {},
                          ),
                          Padding(
                            padding: getPadding(left: 20, right: 20),
                            child: const Text16SemiBold(
                              title: "1",
                            ),
                          ),
                          CartAddRemoveButton(
                            title: '+',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  if (isMyOrderScreen)
                    CustomButton(
                      height: getVerticalSize(
                        40,
                      ),
                      width: getHorizontalSize(
                        134,
                      ),
                      text: "Track Order",
                      margin: getMargin(
                        top: 23,
                      ),
                      shape: ButtonShape.Square,
                      padding: ButtonPadding.paddingAll8,
                      fontStyle: ButtonFontStyle.Bold16,
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.trackOrderScreen);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartAddRemoveButton extends StatelessWidget {
  const CartAddRemoveButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: getPadding(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: (title == '-') ? AppColors.gray10001 : AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: (title == '-') ? Colors.black87 : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
