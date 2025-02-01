import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../../widgets_common/applogo_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Allow resizing when the keyboard appears
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                (context.screenHeight * 0.07).heightBox,
                applogoWidget(),
                10.heightBox,
                "Create an Account".text.fontFamily(bold).white.size(18).make(),
                10.heightBox,
                Column(
                  children: [
                    customTextField(hint: "Enter your name", title: "Name"),
                    customTextField(hint: emailHint, title: email),
                    customTextField(hint: passwordHint, title: password),
                    customTextField(hint: "Retype your password", title: "Retype Password"),
                    10.heightBox,

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isAgreed,
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                          activeColor: redColor,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: iagreeto,
                              style: TextStyle(color: fontGrey, fontFamily: bold),
                              children: [
                                // Define your own TextSpan content here
                                TextSpan(
                                  text: " Terms & Conditions",
                                  style: TextStyle(color: redColor, fontFamily: bold),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(color: fontGrey, fontFamily: regular),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(color: redColor, fontFamily: bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    10.heightBox,

                    // Button should only be active when checkbox is checked
                    ourButton(
                      onPress: () {}, // Disable button if checkbox is not checked
                      color: isAgreed ? redColor : lightGrey,
                      textcolor: whiteColor,
                      title: "Sign Up",
                    ).box.width(context.screenWidth - 50).make(),

                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Already have an account? ".text.color(fontGrey).make(),
                        TextButton(
                          onPressed: () {
                            Get.back(); // Navigate to Sign In Screen
                          },
                          child: "Sign In".text.color(redColor).make(),
                        ),
                      ],
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
