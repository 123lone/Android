import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';  // Added Get import
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centering the column content
          crossAxisAlignment: CrossAxisAlignment.center, // Aligning the widgets centrally
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg, // Ensure the path is correct
                width: 300,
              ),
            ),
            20.heightBox, // Ensure you're using VelocityX for this
            applogoWidget(), // Your custom widget
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
