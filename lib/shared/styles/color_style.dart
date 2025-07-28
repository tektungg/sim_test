import 'package:flutter/material.dart';

class ColorStyle {
  ColorStyle._();

  static const Color primary = Color(0xff007bff);
  static const Color secondary = Color(0xff6c757d);
  static const Color success = Color(0xff28a745);
  static const Color danger = Color(0xffdc3545);
  static const Color warning = Color(0xffffc107);
  static const Color info = Color(0xff17a2b8);
  static const Color light = Color(0xfff8f9fa);
  static const Color dark = Color(0xff343a40);
  static const Color white = Color(0xffffffff);

  static const Color simRed = Color(0xFFE62129);
  static const Color simMapGrey = Color(0xFFBBBDBD);

  static const LinearGradient simCardBgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFDADADB),
      Color(0xFFFFFFFF),
      Color(0xFFDADADB),
      Color(0xFFFFFFFF),
      Color(0xFFDADADB),
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );

  static const Color text100 = Color(0xFFFFFFFF); // white
  static const Color text200 = Color(0xFFF5F5F5);
  static const Color text300 = Color(0xFFE0E0E0);
  static const Color text400 = Color(0xFFBDBDBD);
  static const Color text500 = Color(0xFF9E9E9E);
  static const Color text600 = Color(0xFF757575);
  static const Color text700 = Color(0xFF616161);
  static const Color text800 = Color(0xFF424242);
  static const Color text900 = Color(0xFF000000); // black
}
