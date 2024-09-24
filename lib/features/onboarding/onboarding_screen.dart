import 'dart:async';
import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/controllers/theme_controller.dart';
import 'package:crunchshop/core/helpers/double_back_to_close_app.dart';
import 'package:crunchshop/core/routes/app_routes.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/core/values/local_files.dart';
import 'package:crunchshop/features/onboarding/components/page_pop_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final themeProvider = Get.find<ThemeController>();
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.msg_discover_new_products,
      subText: Loc.alized.msg_many_new_products,
      assetsImage: LocalFiles.imgVectorDeepOrangeA400301x343,
    ));

    pageViewModelData.add(PageViewData(
        titleText: Loc.alized.msg_earn_points_for,
        subText: Loc.alized.msg_the_purpose_of_reward,
        assetsImage: LocalFiles.imgGroup));

    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.msg_get_fast_local_delivery,
      subText: Loc.alized.msg_wow_express_offers,
      assetsImage: LocalFiles.imgVectorRed50,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    pageSnapping: true,
                    onPageChanged: (index) {
                      currentShowIndex = index;
                    },
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      PagePopup(imageData: pageViewModelData[0]),
                      PagePopup(imageData: pageViewModelData[1]),
                      PagePopup(imageData: pageViewModelData[2]),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 3,
                  effect: WormEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Theme.of(context).dividerColor,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      spacing: 5.0), // your preferred effect
                  onDotClicked: (index) {},
                ),
                // CommonButton(
                //   padding: const EdgeInsets.only(
                //       left: 48, right: 48, bottom: 8, top: 32),
                //   buttonText: Loc.alized.login,
                //   onTap: () {

                //   },
                // ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 30,
                )
              ],
            ),
            Positioned(
              right: 20,
              top: 40,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                          color: AppTheme.primaryColor,
                        ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
