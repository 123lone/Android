import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({
  required Function onPress,  // Use required for function
  required Color color,
  required Color textcolor,
  required String title,  // Make sure the title is a String
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color, // Use backgroundColor instead of primary
      padding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // No rounded corners
      ),
    ),
    onPressed: () {
      onPress();  // Call the function
    },
    child: title.text.color(textcolor).fontFamily(bold).make(),  // Ensure login text is from your consts.dart file
  );
}
