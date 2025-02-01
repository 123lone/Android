import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint,controller,}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(

        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: textfieldGrey,
            fontFamily: semibold,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(  // You can define the focused border here
            borderSide: BorderSide(color: redColor),
          ),
        ),
      ),
      5.heightBox
    ],
  );
}
