import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';

import '../../consts/strings.dart';

class CategoryDetails extends StatelessWidget {
  final String title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title.text.fontFamily(bold).white.make(),
        ),

      )
    );
  }
}
