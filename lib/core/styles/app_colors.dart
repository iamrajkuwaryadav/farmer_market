import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static Color blueGray10001 = fromHex('#d3d3d3');

  static Color black90090 = fromHex('#90000000');

  static Color green800 = fromHex('#12991f');

  static Color deepOrangeA40033 = fromHex('#33f13005');

  static Color black900 = fromHex('#000000');

  static Color yellow700 = fromHex('#ffb42e');

  static Color blueGray700 = fromHex('#545c6d');

  static Color blueGray900 = fromHex('#273046');

  static Color deepOrangeA400 = fromHex('#f13005');

  static Color gray90002 = fromHex('#161d2e');

  static Color gray90003 = fromHex('#151b2b');

  static Color gray700 = fromHex('#555c6d');

  static Color gray400 = fromHex('#bfbfbf');

  static Color gray500 = fromHex('#aaaaaa');

  static Color blueGray100 = fromHex('#cccccc');

  static Color blueGray400 = fromHex('#888888');

  static Color gray900 = fromHex('#222222');

  static Color amber700 = fromHex('#ffa305');

  static Color gray90001 = fromHex('#0a1021');

  static Color orange800 = fromHex('#e66712');

  static Color deepOrangeA40026 = fromHex('#26f13005');

  static Color gray60026 = fromHex('#26838383');

  static Color yellowA700 = fromHex('#fadf14');

  static Color gray300 = fromHex('#e5e5e5');

  static Color gray30002 = fromHex('#dddddd');

  static Color gray30001 = fromHex('#dedede');

  static Color gray60028 = fromHex('#28838383');

  static Color gray100 = fromHex('#f7f7f7');

  static Color deepOrangeA40067 = fromHex('#67f13005');

  static Color gray70026 = fromHex('#26666666');

  static Color black90033 = fromHex('#33000000');

  static Color gray10001 = fromHex('#f5f5f5');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
