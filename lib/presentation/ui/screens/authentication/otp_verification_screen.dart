import 'package:craftybay/presentation/ui/screens/authentication/complete_profile_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/utility/image_path.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagePath.logoSVG,
                  width: 120,
                ),
                const SizedBox(height: 14),
                Text(
                  'Enter OTP Code',
                  style: fontStyle(type: 'titleLarge'),
                ),
                Text(
                  'A 4 digit OTP code has benn sent',
                  style: fontStyle(type: 'subtitle'),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    child: PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 44,
                        fieldWidth: 44,
                        activeFillColor: ColorPalette.whiteColor,
                        inactiveFillColor: ColorPalette.whiteColor,
                        selectedFillColor: ColorPalette.whiteColor,
                        activeColor: ColorPalette.primaryColor,
                        inactiveColor: ColorPalette.primaryColor,
                        selectedColor: ColorPalette.primaryColor,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      cursorColor: ColorPalette.primaryColor,
                      keyboardType: TextInputType.number,
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      appContext: context,
                    )),
                ElevatedButton(
                  onPressed: () {
                    Get.to(CompleteProfileScreen());
                  },
                  child: Text('Next'),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'This code will expire in '),
                      TextSpan(
                        text: '120s',
                        style: fontStyle(
                            clr: ColorPalette.primaryColor,
                            fw: FontWeight.w500),
                      ),
                    ],
                    style: fontStyle(clr: ColorPalette.subtitleColor),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: fontStyle(
                        clr: ColorPalette.subtitleColor, fw: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
