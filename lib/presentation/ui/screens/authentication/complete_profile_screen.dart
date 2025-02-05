import 'package:craftybay/presentation/ui/screens/authentication/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_path.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
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
                    'Complete Profile',
                    style: fontStyle(type: 'titleLarge'),
                  ),
                  Text(
                    'Get started with us with your details',
                    style: fontStyle(type: 'subtitle'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(hintText: 'First Name'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Enter your mobile number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Mobile'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your city name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'City'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 24),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Enter your shipping address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Shipping Address',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const OtpVerificationScreen());
                    },
                    child: Text('Complete'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
