import 'package:craftybay/presentation/ui/screens/authentication/email_verification_screen.dart';
import 'package:craftybay/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/logo.svg')),
            Spacer(),
            CircularProgressIndicator(
              color: Color(0xFF2cadad),
            ),
            Text('Version 1.0.0')
          ],
        ),
      ),
    );
  }
}
