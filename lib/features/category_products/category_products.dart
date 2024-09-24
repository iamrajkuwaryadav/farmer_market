import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/features/home_page/widgets/product_item_card.dart';

import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  late List<ProductModel> categoryProducts;

  @override
  void initState() {
    super.initState();
    getFavoriteProducts();
  }

  getFavoriteProducts() {
    categoryProducts = productsList;

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
            title: AppbarSubtitle1(text: widget.categoryTitle)),
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
                    itemCount: categoryProducts.length,
                    itemBuilder: (context, index) {
                      return ProductItemCard(
                        productModel: categoryProducts[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                productModel: categoryProducts[index],
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
