import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    this.alignment,
    this.margin,
    this.value,
    this.onChanged,
  });

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final bool? value;

  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: value ?? false,
        height: getHorizontalSize(20),
        width: getHorizontalSize(41),
        toggleSize: 14,
        borderRadius: getHorizontalSize(
          10.00,
        ),
        activeColor: AppTheme.primaryColor.withOpacity(0.3),
        activeToggleColor: AppTheme.primaryColor,
        inactiveColor: AppColors.gray70026,
        inactiveToggleColor: AppColors.gray400,
        onToggle: (val) {
          "is".log();
          onChanged!(val);
        },
      ),
    );
  }
}


// class CustomSwitch extends StatelessWidget {
//   CustomSwitch({
//     super.key,
//     this.alignment,
//     this.margin,
//     this.value,
//     this.onChanged,
//   });

//   Alignment? alignment;

//   EdgeInsetsGeometry? margin;

//   bool? value;

//   Function(bool)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//             alignment: alignment ?? Alignment.center,
//             child: _buildSwitchWidget(),
//           )
//         : _buildSwitchWidget();
//   }

//   _buildSwitchWidget() {
//     return Padding(
//       padding: margin ?? EdgeInsets.zero,
//       child: FlutterSwitch(
//         value: value ?? false,
//         height: getHorizontalSize(18),
//         width: getHorizontalSize(36),
//         toggleSize: 18,
//         borderRadius: getHorizontalSize(
//           9.00,
//         ),
//         activeColor: AppTheme.primaryColor.withOpacity(0.3),
//         activeToggleColor: AppTheme.primaryColor,
//         inactiveColor: AppColors.gray70026,
//         inactiveToggleColor: AppColors.gray400,
//         onToggle: (value) {
//           onChanged!(value);
//         },
//       ),
//     );
//   }
// }
