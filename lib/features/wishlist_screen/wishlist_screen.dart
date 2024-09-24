import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/features/home_page/widgets/product_item_card.dart';

import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late List<ProductModel> favoriteProducts;

  @override
  void initState() {
    super.initState();
    getFavoriteProducts();
  }

  getFavoriteProducts() {
    favoriteProducts =
        productsList.where((product) => product.isFavorite).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(85),
            leadingWidth: 40,
            leading: AppbarImage(
              height: getVerticalSize(18),
              width: getHorizontalSize(10),
              svgPath: LocalFiles.imgArrowleft,
              margin: getMargin(left: 30, top: 19, bottom: 18),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: AppbarSubtitle1(text: Loc.alized.lbl_wishlist)),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(top: 8),
                child: const DividerWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: getPadding(left: 30, top: 30, right: 30),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getVerticalSize(258),
                        crossAxisCount: 2,
                        mainAxisSpacing: getHorizontalSize(30),
                        crossAxisSpacing: getHorizontalSize(30)),
                    physics: const BouncingScrollPhysics(),
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      return ProductItemCard(
                        productModel: favoriteProducts[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                productModel: favoriteProducts[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
