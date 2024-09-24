// ignore_for_file: constant_identifier_names

import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      iconSelected: LocalFiles.imgHomeRedFilled,
      iconUnSelected: LocalFiles.imgHomeGrayOutLined,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      iconSelected: LocalFiles.imgHeartFilledRed,
      iconUnSelected: LocalFiles.imgWishlistBlueGray700,
      type: BottomBarEnum.WishList,
    ),
    BottomMenuModel(
      iconSelected: LocalFiles.imgCartOutFilledRed,
      iconUnSelected: LocalFiles.imgCartOutLinedGrey,
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      iconSelected: LocalFiles.imgAccountFilledRed,
      iconUnSelected: LocalFiles.imgAccountOutLinedGrey,
      type: BottomBarEnum.Account,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bottomNavigationBarBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              30,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              30,
            ),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black90033,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              svgPath: bottomMenuList[index].iconUnSelected,
              height: getSize(
                26,
              ),
              width: getSize(
                26,
              ),
            ),
            activeIcon: CustomImageView(
              svgPath: bottomMenuList[index].iconSelected,
              height: getVerticalSize(
                23,
              ),
              width: getHorizontalSize(
                24,
              ),
              color: AppColors.deepOrangeA400,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  WishList,
  Cart,
  Account,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.iconSelected,
    required this.iconUnSelected,
    required this.type,
  });

  final String iconSelected;
  final String iconUnSelected;
  final BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Default Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
