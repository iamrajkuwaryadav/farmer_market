import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/helpers/star_rating_bar/rating_bar.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    this.onTap,
    required this.productModel,
  });

  final ProductModel productModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Column(
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
                      CustomImageView(
                        svgPath: productModel.isFavorite
                            ? LocalFiles.imgHeartFilledRed
                            : LocalFiles.imgHeartOutLinedGrey,
                        height: getSize(20),
                        width: getSize(20),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            RatingBar.builder(
              itemSize: 20,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
              padding: getPadding(
                top: 7,
              ),
              child: Text16SemiBold(
                title: productModel.productTitle,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 5,
              ),
              child: Text16SemiBoldPrimary(
                title: productModel.price,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
