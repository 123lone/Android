import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/home_screen/components/featured_button.dart';
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
        child: Scrollbar(
          thickness: 5,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                const SizedBox(height: 10),

                // Swiper brands
                VxSwiper.builder(
                  itemCount: Sliderslist.length,
                  aspectRatio: 16 / 9,
                  height: 150,
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
                        (index) => Flexible(
                      child: HomeButtons(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 2.5,
                        icon: index == 0 ? icTodaysDeal : icFlashDeal,
                        title: index == 0 ? todayDeal : flashsale,
                        onPress: () {},
                      ),
                    ),
                  ),
                ),

                10.heightBox,

                // Second Swiper
                VxSwiper.builder(
                  itemCount: Sliderslist2.length,
                  aspectRatio: 16 / 9,
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      Sliderslist2[index],
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

                // Another Row for Additional Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                        (index) => Flexible(
                      child: HomeButtons(
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
                ),

                20.heightBox,

                // Featured Category Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuredcategory.text
                      .color(darkFontGrey)
                      .size(18)
                      .fontFamily(semibold)
                      .make(),
                ),

                20.heightBox,

                // Featured Button Widgets
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Featuredbutton(
                              icon: featuredImages[index],
                              title: featuredTitles1[index],
                            ),
                            10.heightBox,
                            Featuredbutton(
                              icon: featuredImages2[index],
                              title: featuredTitles2[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                20.heightBox,

                // Featured Products
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: redColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featuredProduct.text.white.fontFamily(bold).size(18).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            6,
                                (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(imgP1,
                                    width: 150, fit: BoxFit.cover),
                                10.heightBox,
                                "Laptop 4GB/64GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .padding(EdgeInsets.all(8))
                                .make(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                20.heightBox,

                // Final Swiper
                VxSwiper.builder(
                  itemCount: Sliderslist.length,
                  aspectRatio: 16 / 9,
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: true,
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

                20.heightBox, // Final spacing to prevent UI from being too tight
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300), itemBuilder: (context,index){

                  return Column(
                    children: [
                      Image.asset(imgP5,width: 200,fit: BoxFit.fill,height: 200,),
                      const Spacer(),
                      "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make()

                    ],
                  ).box.white.roundedSM.padding(const EdgeInsets.all(12)).margin(const EdgeInsets.symmetric(horizontal: 4)).make();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
