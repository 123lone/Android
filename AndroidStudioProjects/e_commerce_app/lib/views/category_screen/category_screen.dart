import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),

        body: Column(
          children: [
            20.heightBox, // ✅ Added spacing **below the AppBar**
            Expanded( // ✅ Wrap GridView in Expanded to avoid overflow
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: Categorieslist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 180,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          CategoriesImages[index],
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        10.heightBox,
                        Categorieslist[index]
                            .text
                            .align(TextAlign.center)
                            .color(darkFontGrey)
                            .make()
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .clip(Clip.antiAlias)
                        .outerShadowSm
                        .make()
                        .onTap(() {
                      Get.to(() => CategoryDetails(title: Categorieslist[index]));
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
