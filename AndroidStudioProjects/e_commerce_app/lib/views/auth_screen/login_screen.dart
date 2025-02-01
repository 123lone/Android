

import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/home_screen/home.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import '../../widgets_common/applogo_widget.dart';

import 'package:e_commerce_app/views/auth_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.07).heightBox,
              applogoWidget(),
              10.heightBox,
              "Login to $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetpass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  // Pass required parameters to the button
                  ourButton(
                    onPress: () {
                      Get.to(()=>const Home());
                    },
                    color: redColor,
                    textcolor: whiteColor,
                    title: "Login", // Ensure the title text is passed correctly
                  ).box.width(context.screenWidth - 50).make(),


                  5.heightBox,
                  createnewaccount.text.color(fontGrey).make(),
                  5.heightBox,


                  ourButton(
                    onPress: () {
                      Get.to(() => SignupScreen());
                    },
                    color: lightgolden,
                    textcolor: redColor,
                    title: "Signup", // Ensure the title text is passed correctly
                  ).box.width(context.screenWidth - 50).make(),

                  10.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  5.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(

                        backgroundColor: lightGrey,
                        radius: 25,

                        child: Image.asset(socialIconList[index],width: 30,),
                      ),
                    )),
                  )

                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).make(),







            ],
          ),
        ),
      ),
    );
  }
}