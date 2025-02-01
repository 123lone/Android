import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: Scrollbar( // Adding Scrollbar
          thickness: 5, // Scrollbar thickness
          radius: const Radius.circular(10), // Rounded corners for scrollbar
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),// Wrapping with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                // Search Bar
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: lightGrey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      hintStyle: TextStyle(color: textfieldGrey),
                    ),
                  ),
                ),

                const SizedBox(height: 10), // Added spacing between search bar and swiper

                // Swiper brands
                VxSwiper.builder(
                  itemCount: Sliderslist.length,
                  aspectRatio: 16 / 9,
                  height: 150, // Added height for the swiper
                  enlargeCenterPage: true,
                  autoPlay: true,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      Sliderslist[index],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make();
                  },
                ),

                10.heightBox,

                // Home Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    2,
                        (index) => HomeButtons(
                      height: context.screenHeight * 0.15,
                      width: context.screenWidth / 2.5,
                      icon: index == 0 ? icTodaysDeal : icFlashDeal,
                      title: index == 0 ? todayDeal : flashsale,
                      onPress: () {},
                    ),
                  ),
                ),

                // Second Swiper
                10.heightBox,
                VxSwiper.builder(
                  itemCount: Sliderslist.length, // Ensure correct list is used
                  aspectRatio: 16 / 9,
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      Sliderslist2[index], // Ensure the correct list is used
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make();
                  },
                ),

                10.heightBox, // 🛑 **Fix: Added missing comma**

                // Another Row for Additional Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                        (index) => HomeButtons(
                      width: context.screenWidth / 3.5,
                      height: context.screenHeight * 0.15,
                      icon: index == 0
                          ? icTopCategories
                          : index == 1
                          ? icBrands
                          : icTopSeller,
                      title: index == 0
                          ? topCategory
                          : index == 1
                          ? topBrand
                          : topSeller,
                      onPress: () {},
                    ),
                  ),
                ),

                10.heightBox,

                // Featured Category Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuredcategory.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),
                ),

                20.heightBox, // Extra space for better UI

              ],
            ),
          ),
        ),
      ),
    );
  }
}
