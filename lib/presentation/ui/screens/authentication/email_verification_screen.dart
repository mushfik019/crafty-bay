import 'package:craftybay/presentation/ui/screens/authentication/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_path.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                  'Welcome Back',
                  style: fontStyle(type: 'titleLarge'),
                ),
                Text(
                  'Please enter your email address',
                  style: fontStyle(type: 'subtitle'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14, top: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email Address'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const OtpVerificationScreen());
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
