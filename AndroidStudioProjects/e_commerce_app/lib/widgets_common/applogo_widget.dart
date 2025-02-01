import 'package:flutter/material.dart'; // Import for Widget, Image, EdgeInsets, etc.
import 'package:e_commerce_app/consts/consts.dart'; // Import for icAppLogo

Widget applogoWidget() {
  // Using VelocityX for styling
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
