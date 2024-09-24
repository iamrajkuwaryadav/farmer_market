import 'package:carousel_slider/carousel_slider.dart';
import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/helpers/star_rating_bar/rating_bar.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/product_detail_screen/widgets/slider237901l1i_item_widget.dart';
import 'package:crunchshop/features/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(86),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(10),
            svgPath: LocalFiles.imgArrowleft,
            margin: getMargin(left: 30, top: 18, bottom: 19),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            AppbarImage(
              height: getVerticalSize(18),
              width: getHorizontalSize(20),
              svgPath: widget.productModel.isFavorite
                  ? LocalFiles.imgHeartFilledRed
                  : LocalFiles.imgFavorite,
              margin: getMargin(left: 30, top: 18, right: 30, bottom: 19),
              onTap: () {},
            )
          ],
        ),
        bottomNavigationBar: Card(
          elevation: 10,
          child: CustomButton(
            height: getVerticalSize(55),
            text: Loc.alized.lbl_add_to_cart,
            margin: getMargin(left: 30, right: 30, bottom: 30),
            shape: ButtonShape.Square,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShoppingCartScreen(),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DividerWidget(),
              SizedBox(height: getSize(20)),
              Container(
                width: size.width,
                margin: getMargin(left: 30, right: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(left: 50, right: 50),
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: getVerticalSize(240),
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    sliderIndex = index;
                                    setState(() {});
                                  }),
                              itemCount:
                                  widget.productModel.productImagesList.length,
                              itemBuilder: (context, index, realIndex) {
                                return SliderItemImageWidget(
                                  imagePath: widget
                                      .productModel.productImagesList[index],
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: getVerticalSize(10),
                              margin: getMargin(top: 40),
                              child: AnimatedSmoothIndicator(
                                activeIndex: sliderIndex,
                                count: widget
                                    .productModel.productImagesList.length,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                  spacing: 10,
                                  activeDotColor: AppTheme.primaryColor,
                                  dotColor:
                                      AppTheme.primaryColor.withOpacity(0.3),
                                  dotHeight: getVerticalSize(10),
                                  dotWidth: getHorizontalSize(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 34),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextSemiBold20(
                                  title: widget.productModel.productTitle,
                                ),
                                TextSemiBold20Primary(
                                  title: widget.productModel.price,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  itemSize: 20,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.only(right: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                  onRatingUpdate: (rating) {
                                    '$rating'.log();
                                  },
                                ),
                                widget.productModel.inStockQuantity > 0
                                    ? Text(
                                        Loc.alized.msg_available_in_stock,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSemiBold16Green800,
                                      )
                                    : Text(
                                        Loc.alized.msg_out_of_stock,
                                        style: TextStyle(
                                          color: AppColors.yellow700,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                              ],
                            ),
                          ),
                          SizedBox(height: getSize(20)),
                          const DividerWidget(),
                          Padding(
                            padding: getPadding(top: 34),
                            child: TextSemiBold20(
                              title: Loc.alized.lbl_color_variant,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              padding: getPadding(left: 0, top: 19),
                              itemCount:
                                  widget.productModel.colorVariantsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: getMargin(right: 15),
                                  height: getSize(35),
                                  width: getSize(35),
                                  decoration: BoxDecoration(
                                    color: AppColors.fromHex(widget
                                        .productModel.colorVariantsList[index]),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: getSize(30)),
                          const DividerWidget(),
                          Padding(
                            padding: getPadding(top: 34),
                            child: ProductFeatureTile(
                              title: Loc.alized.lbl_brand,
                              value: widget.productModel.brand,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 13),
                            child: ProductFeatureTile(
                              title: Loc.alized.lbl_model_name,
                              value: widget.productModel.model,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 14),
                            child: ProductFeatureTile(
                              title: Loc.alized.lbl_colour,
                              value: widget.productModel.colorName,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 11),
                            child: ProductFeatureTile(
                              title: Loc.alized.lbl_style,
                              value: widget.productModel.style,
                            ),
                          ),
                          SizedBox(height: getSize(50)),
                          const DividerWidget(),
                          Padding(
                            padding: getPadding(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text18Bold(
                                      title: Loc.alized.msg_get_free_delivery,
                                    ),
                                    Padding(
                                      padding: getPadding(top: 30, bottom: 30),
                                      child: CustomImageView(
                                        svgPath:
                                            LocalFiles.imgVolumeDeepOrangeA400,
                                        height: getVerticalSize(36),
                                        width: getHorizontalSize(33),
                                      ),
                                    ),
                                    Text18Bold(
                                      title: Loc.alized.lbl_pay_on_delivery,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text18Bold(
                                      title: Loc.alized.lbl_07_days_replace,
                                    ),
                                    Padding(
                                      padding: getPadding(top: 30, bottom: 30),
                                      child: CustomImageView(
                                        svgPath: LocalFiles.imgReplace,
                                        height: getVerticalSize(36),
                                        width: getHorizontalSize(33),
                                      ),
                                    ),
                                    Text18Bold(
                                      title: Loc.alized.lbl_warranty_policy,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: getPadding(top: 30),
                              child: const DividerWidget()),
                          Padding(
                            padding: getPadding(top: 30),
                            child: Text18Bold(
                              title: Loc.alized.lbl_about_this_item,
                            ),
                          ),
                          Container(
                            margin: getMargin(top: 18, right: 31),
                            child: const Text16Grey(
                              title:
                                  "At vero eos et accusamus et iusto odio dig\nssimos ducimus qui blanditiis praesentium \nvoluptatum deleniti atque corrupti quos do\nlores et quas molestias excepturi...",
                            ),
                          ),
                          Container(
                            margin: getMargin(top: 20, right: 34),
                            child: const Text16Grey(
                              title:
                                  "At vero eos et accusamus et iusto odio dig\nssimos ducimus qui blanditiis praesentium \nvoluptatum deleniti atque .",
                            ),
                          ),
                          SizedBox(height: getSize(30))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductFeatureTile extends StatelessWidget {
  const ProductFeatureTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text18Bold(
          title: title,
        ),
        Text18BoldGrey(title: value)
      ],
    );
  }
}
