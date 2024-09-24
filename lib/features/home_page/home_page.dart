import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/models/category_model.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/home_page/widgets/category_icon_item.dart';
import 'package:crunchshop/features/home_page/widgets/circular_image.dart';
import 'package:crunchshop/features/home_page/widgets/crunch_shop_logo_text.dart';
import 'package:crunchshop/features/home_page/widgets/product_item_card.dart';
import 'package:crunchshop/features/profile_screen/profile_screen.dart';
import 'package:crunchshop/features/product_detail_screen/product_detail_screen.dart';
import 'package:crunchshop/features/product_search_result/product_search_result.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorSearch = '';
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;
  double bottomPadding = 30;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(92),
          leadingWidth: 54,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(24),
            svgPath: LocalFiles.imgMenu,
            margin: getMargin(left: 30, top: 19, bottom: 19),
            onTap: () {
              Scaffold.of(context).openDrawer(

              );
            },
          ),
          centerTitle: true,
          title: const CrunchShopLogoText(),
          actions: [
            Container(
                margin: getMargin(left: 30, top: 8, right: 30, bottom: 8),
                child: CircularImage(
                  imagePath: LocalFiles.imgImage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ))
          ],
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Align(
                  alignment: Alignment.center,
                  child: CustomTextFormField(
                    focusNode: _searchFocusNode,
                    controller: _searchController,
                    hintText: Loc.alized.msg_search_smartphone,
                    margin: getMargin(left: 30, top: 12, right: 30),
                    padding: TextFormFieldPadding.PaddingAll17,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin:
                          getMargin(left: 15, top: 20, right: 12, bottom: 20),
                      child: CustomImageView(
                        svgPath: LocalFiles.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(64),
                    ),
                    suffix: InkWell(
                      onTap: () {
                        if (_allValidation()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductSearchResult(),
                            ),
                          );
                        } else {
                          "_allValidation returned false".log();
                        }
                      },
                      child: Container(
                        padding: getPadding(all: 11),
                        margin:
                            getMargin(left: 30, top: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: AppColors.deepOrangeA400,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(20),
                          ),
                        ),
                        child: CustomImageView(
                          svgPath: LocalFiles.imgTicket,
                        ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(64),
                    ),
                    onValueChange: (value) {
                      _allValidation();
                    },
                    validator: (value) {
                      if (_errorSearch != "") {
                        return _errorSearch;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: getPadding(left: 30, top: 35),
                child: TextSemiBold20(
                  title: Loc.alized.msg_shop_by_category,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: getPadding(left: 30, top: 19),
                  itemCount: categoriesList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryIconItem(
                      categoryTitle: categoriesList[index].title,
                      iconPath: categoriesList[index].iconPath,
                    );
                  },
                ),
              ),
              Padding(
                padding: getPadding(left: 30, top: 47),
                child: TextSemiBold20(
                  title: Loc.alized.lbl_newest_arrival,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 30, top: 21, right: 30),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getVerticalSize(258),
                          crossAxisCount: 2,
                          mainAxisSpacing: getHorizontalSize(30),
                          crossAxisSpacing: getHorizontalSize(30)),
                      physics: const BouncingScrollPhysics(),
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        return ProductItemCard(
                          productModel: productsList[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  productModel: productsList[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _allValidation() {
    "_allSignInValidation is called".log();
    bool isValid = true;

    if (_searchController.text.trim().isEmpty) {
      _errorSearch = Loc.alized.required;
      isValid = false;
    } else {
      _errorSearch = '';
    }
    setState(() {});
    return isValid;
  }
}
