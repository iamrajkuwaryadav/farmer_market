import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/checkout_delivery_information_screen.dart';
import 'package:crunchshop/features/shopping_cart_screen/components/cart_product_item_card.dart';
import 'package:crunchshop/features/shopping_cart_screen/components/delete_product_dialog.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<ProductModel> cartProducts;

  String _errorPromoCode = '';
  late TextEditingController _promoCodeController;
  late FocusNode _promoFocusNode;
  double bottomPadding = 30;

  @override
  void initState() {
    _promoCodeController = TextEditingController();
    _promoFocusNode = FocusNode();

    super.initState();
    getFavoriteProducts();
  }

  getFavoriteProducts() {
    cartProducts = productsList.where((product) => product.isFavorite).toList();
    setState(() {});
  }

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(87),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(10),
            svgPath: LocalFiles.imgArrowleft,
            margin: getMargin(left: 30, top: 17, bottom: 20),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle1(text: Loc.alized.lbl_shopping_cart),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DividerWidget(),
                Padding(
                  padding: getPadding(left: 30, top: 30, right: 30),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      return CartProductItemCard(
                        productModel: cartProducts[index],
                        onTapRemove: () {
                          onTapRemoveProductFromCart(context);
                        },
                      );
                    },
                  ),
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomTextFormField(
                      focusNode: _promoFocusNode,
                      controller: _promoCodeController,
                      hintText: Loc.alized.lbl_promocodes,
                      margin: getMargin(left: 30, top: 12, right: 30),
                      padding: TextFormFieldPadding.PaddingAll17,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(64),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          if (_allValidation()) {
                          } else {
                            "_allValidation returned false".log();
                          }
                        },
                        child: Padding(
                          padding: getPadding(right: 10),
                          child: const Text18BoldPrimary(title: 'Apply'),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(64),
                      ),
                      onValueChange: (value) {
                        _allValidation();
                      },
                      validator: (value) {
                        if (_errorPromoCode != "") {
                          return _errorPromoCode;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 30, top: 50),
                    child: Text(
                      Loc.alized.lbl_order_info,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSemiBold20,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 21, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text18Grey(title: Loc.alized.lbl_subtotal),
                      const Text18Grey(title: "+ 890.00")
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 12, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text18Grey(title: Loc.alized.lbl_shipping_charge),
                      const Text18Grey(title: "+ 10.00")
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 17, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text18BoldGrey(title: Loc.alized.lbl_total),
                      const Text18BoldPrimary(title: "900.00")
                    ],
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(55),
                  text: Loc.alized.lbl_checkout,
                  margin: getMargin(left: 30, top: 50, right: 30),
                  shape: ButtonShape.Square,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CheckoutDeliveryInformationScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _allValidation() {
    "_allSignInValidation is called".log();
    bool isValid = true;

    if (_promoCodeController.text.trim().isEmpty) {
      _errorPromoCode = Loc.alized.required;
      isValid = false;
    } else {
      _errorPromoCode = '';
    }
    setState(() {});
    return isValid;
  }

  onTapRemoveProductFromCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        content: DeleteProductDialog(),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(left: 0),
      ),
    );
  }
}
