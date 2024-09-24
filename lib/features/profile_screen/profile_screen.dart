import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/controllers/theme_controller.dart';
import 'package:crunchshop/core/enums/enums.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/models/language_model.dart';
import 'package:crunchshop/core/routes/navigation_services.dart';
import 'package:crunchshop/core/styles/text_styles.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:crunchshop/features/my_orders_screen/my_orders_screen.dart';
import 'package:crunchshop/features/profile_screen/components/my_account_list_tile.dart';
import 'package:crunchshop/widgets/common_card.dart';
import 'package:crunchshop/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool isNotificationsSelected = false;

  bool isDarkMode = false;
  var country = 'Australia';
  var currency = '\$ AUD';
  int selectedRadioTile = 0;

  @override
  void initState() {
    super.initState();
    checkIsDarkMode();
  }

  checkIsDarkMode() {
    bool isThemeSetToLightMode = Get.find<ThemeController>().isLightMode;

    setState(() {
      isDarkMode = !isThemeSetToLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.find<ThemeController>();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(88),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(10),
            svgPath: LocalFiles.imgArrowleft,
            margin: getMargin(left: 30, top: 16, bottom: 21),
            onTap: () {
              onTapArrowleft12(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle1(
            text: Loc.alized.lbl_my_account,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 5, bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DividerWidget(),
                ProfileImageWidget(
                  imagePath: LocalFiles.imgImage150x150,
                  iconPath: LocalFiles.imgEditicon,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: getPadding(top: 19),
                  child: const HeadingText20(
                    title: "Saul Goodmate",
                  ),
                ),
                Padding(
                  padding: getPadding(top: 7, bottom: 30),
                  child: const Text18BoldGrey(
                    title: "saulgo35@gmail.com",
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.lbl_notification,
                  leadingWidget: CustomSwitch(
                    margin: getMargin(top: 3, bottom: 1),
                    value: isNotificationsSelected,
                    onChanged: (value) {
                      "onChanged value $value".log();
                      setState(() {
                        isNotificationsSelected = value;
                      });
                    },
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.lbl_my_orders,
                  leadingWidget: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyOrdersScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_forward,
                        color: Theme.of(context).hintColor),
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.lbl_dark_mode,
                  leadingWidget: CustomSwitch(
                    margin: getMargin(top: 3, bottom: 1),
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                      if (value) {
                        themeProvider.updateThemeMode(ThemeModeType.dark);
                      }

                      if (!value) {
                        themeProvider.updateThemeMode(ThemeModeType.light);
                      }
                    },
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.fonts,
                  leadingWidget: InkWell(
                    child: Icon(
                      FontAwesomeIcons.font,
                      color: AppTheme.primaryColor,
                    ),
                    onTap: () {
                      _getFontPopUI();
                    },
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.language,
                  leadingWidget: InkWell(
                    onTap: () {
                      _getLanguageUI();
                    },
                    child: Row(
                      children: [
                        Text(Get.find<Loc>().locale.languageCode),
                        const SizedBox(width: 7),
                        Icon(
                          Icons.translate_outlined,
                          color: AppTheme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.color,
                  leadingWidget: InkWell(
                    child: Icon(
                      Icons.color_lens,
                      color: AppTheme.primaryColor,
                    ),
                    onTap: () {
                      _getColorPopUI();
                    },
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.country,
                  leadingWidget: InkWell(
                    onTap: () {
                      NavigationServices(context)
                          .gotoCountryScreen()
                          .then((value) {
                        if (value is String && value != "") {
                          setState(() {
                            country = value;
                          });
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Text(country),
                        const SizedBox(width: 7),
                        Icon(
                          FontAwesomeIcons.userGroup,
                          color: AppTheme.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.currency,
                  leadingWidget: InkWell(
                    child: Row(
                      children: [
                        Text(currency),
                        const SizedBox(width: 7),
                        Icon(FontAwesomeIcons.gift,
                            color: AppTheme.primaryColor, size: 20),
                      ],
                    ),
                    onTap: () {
                      NavigationServices(context)
                          .gotoCurrencyScreen()
                          .then((value) {
                        if (value is String && value != "") {
                          setState(() {
                            currency = value;
                          });
                        }
                      });
                    },
                  ),
                ),
                MyAccountListTile(
                  title: Loc.alized.terms_of_services,
                  leadingWidget: buildArrowImageRight(),
                ),
                MyAccountListTile(
                  title: Loc.alized.privacy_policy,
                  leadingWidget: buildArrowImageRight(),
                ),
                MyAccountListTile(
                  title: Loc.alized.give_us_feedbacks,
                  leadingWidget: buildArrowImageRight(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 30, top: 31, bottom: 5),
                    child: Text18BoldPrimary(
                      title: Loc.alized.log_out,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildArrowImageRight() {
    return Icon(Icons.arrow_forward, color: Theme.of(context).hintColor);
  }

  onTapBtnEditicon(BuildContext context) {}

  onTapArrowleft12(BuildContext context) {
    Navigator.pop(context);
  }

  _getFontPopUI() {
    final List<Widget> fontArray = [];
    FontFamilyType.values.toList().forEach(
      (element) {
        fontArray.add(
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                Get.find<ThemeController>().updateFontType(element);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hello",
                      style: AppTheme.getTextStyle(
                        element,
                        TextStyles(context).getRegularStyle().copyWith(
                            color:
                                Get.find<ThemeController>().fontType == element
                                    ? AppTheme.primaryColor
                                    : AppTheme.fontColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: FontFamilyType.workSans == element ? 3 : 0),
                      child: Text(
                        element.toString().split('.')[1],
                        style: AppTheme.getTextStyle(
                          element,
                          TextStyles(context).getRegularStyle().copyWith(
                              color: Get.find<ThemeController>().fontType ==
                                      element
                                  ? AppTheme.primaryColor
                                  : AppTheme.fontColor),
                        ).copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      Loc.alized.selected_fonts,
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fontArray[0],
                            fontArray[1],
                            fontArray[2],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fontArray[3],
                            fontArray[4],
                            fontArray[5],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fontArray[6],
                            fontArray[7],
                            fontArray[8],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fontArray[9],
                            fontArray[10],
                            fontArray[11],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getColorPopUI() {
    final List<Widget> fontArray = [];

    ColorType.values.toList().forEach((element) {
      fontArray.add(
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {
              Get.find<ThemeController>().updateColorType(element);
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 38,
                    width: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                Get.find<ThemeController>().colorType == element
                                    ? AppTheme.getColor(element)
                                    : Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.getColor(element)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });

    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      Loc.alized.selected_color,
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Divider(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        fontArray[0],
                        fontArray[1],
                        fontArray[2],
                        fontArray[3],
                        fontArray[4]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguageUI() {
    final List<Widget> languageArray = [];
    final list = getLocalesFromLanguageModels();
    List<String> languageTexts = getLanguageNamesFromLanguageModels();

    for (var i = 0; i < list.length; i++) {
      final element = list[i];
      languageArray.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Get.find<Loc>().localeLanguage(element);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, bottom: 16, top: 16, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Get.find<Loc>().locale == element
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_off),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(languageTexts[i]),
                      const SizedBox(width: 10),
                      Text(
                        getFlagFromLanguageTitle(languageTexts[i]),
                        style: TextStyle(fontSize: getFontSize(18)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(
                      Loc.alized.selected_language,
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Divider(
                    height: 16,
                  ),
                  for (var item in languageArray) item,
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
