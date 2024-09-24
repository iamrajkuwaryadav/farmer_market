import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/home_page/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

/// Application Drawer Widget
class AppDrawer extends StatelessWidget {
  /// Constructor values
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const DrawerHeaderWidget(),
          Padding(padding: getPadding(top: 20)),
          const DividerWidget(
            indent: 20,
            endIndent: 20,
          ),
          Padding(padding: getPadding(top: 20)),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                DrawerListTile(
                  iconPath: LocalFiles.imgRewardIcon,
                  linkTitle: Loc.alized.lbl_rewards,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerListTile(
                  iconPath: LocalFiles.imgAccountWhiteA700,
                  linkTitle: Loc.alized.lbl_help,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerListTile(
                  iconPath: LocalFiles.imgQuestion,
                  linkTitle: Loc.alized.lbl_contact_us,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerListTile(
                  iconPath: LocalFiles.imgCheckmarkWhiteA700,
                  linkTitle: Loc.alized.lbl_privacy_policy,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerListTile(
                  iconPath: LocalFiles.imgLogout,
                  linkTitle: Loc.alized.lbl_logout,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
