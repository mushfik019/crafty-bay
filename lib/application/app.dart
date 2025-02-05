import 'package:craftybay/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: MaterialColor(
            ColorPalette.primaryColor.hashCode, ColorPalette().color),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintStyle: fontStyle(clr: ColorPalette.hintColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: ColorPalette.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: ColorPalette.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 2, color: ColorPalette.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle:
                fontStyle(clr: ColorPalette.subtitleColor, fw: FontWeight.w500),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: fontStyle(type: 'button'),
            minimumSize: Size(double.infinity, 44),
            backgroundColor: ColorPalette.primaryColor,
            foregroundColor: ColorPalette.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
