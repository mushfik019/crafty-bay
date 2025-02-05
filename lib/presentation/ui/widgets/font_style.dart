import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

fontStyle({String type = 'body', double? size, Color? clr, FontWeight? fw}) {
  TextStyle baseStyle = GoogleFonts.poppins(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
  switch (type) {
    case 'titleLarge':
      return baseStyle.copyWith(
        fontSize: size ?? 28,
        fontWeight: fw ?? FontWeight.w900,
        color: clr ?? ColorPalette.titleColor,
      );
    case 'title':
      return baseStyle.copyWith(
        fontSize: size ?? 20,
        fontWeight: fw ?? FontWeight.bold,
      );
    case 'subtitle':
      return baseStyle.copyWith(
        fontSize: size ?? 14,
        fontWeight: fw ?? FontWeight.normal,
        color: clr ?? ColorPalette.subtitleColor,
      );
    case 'body':
      return baseStyle.copyWith(
        fontSize: size ?? 14,
        fontWeight: fw ?? FontWeight.normal,
      );
    case 'button':
      return baseStyle.copyWith(
        fontSize: size ?? 14,
        fontWeight: fw ?? FontWeight.w600,
        color: clr ?? ColorPalette.whiteColor,
      );
  }
}
