import 'package:craftybay/presentation/ui/screens/authentication/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_path.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
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
                  TextFormField(
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(hintText: 'Last Name'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your review';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write Review',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const OtpVerificationScreen());
                    },
                    child: Text('Submit'),
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
