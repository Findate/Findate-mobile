// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppColor {
  static const Color mainColor = Color(0xffFF6685);

  static const Color secondaryMain = Color(0xff6D64FF);

  static const Color grey400 = Color(0xff808080);

  static const Color dullBlack = Colors.black;

  static LinearGradient mixedColorgradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xffFF6685),
      Color(0xff6D64FF),
    ],
  );
}
