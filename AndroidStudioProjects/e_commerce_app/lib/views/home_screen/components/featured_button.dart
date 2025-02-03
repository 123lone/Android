import 'package:flutter/material.dart';
import 'package:e_commerce_app/consts/consts.dart';

Widget Featuredbutton({String? title,icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(8)).rounded.outerShadowMd.width(200).make();
}