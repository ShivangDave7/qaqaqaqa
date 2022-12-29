import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black900 = fromHex('#000000');

  static Color blueGray300 = fromHex('#9098b1');

  static Color bluegray400 = fromHex('#888888');

  static Color lightBlueA200 = fromHex('#40bfff');

  static Color indigoA200 = fromHex('#5b61f4');

  static Color indigo900 = fromHex('#223263');

  static Color lightBlueA2003d = fromHex('#3d40bfff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blue50 = fromHex('#eaefff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
