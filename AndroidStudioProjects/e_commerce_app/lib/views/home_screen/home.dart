import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/views/category_screen/category_screen.dart';
import 'package:e_commerce_app/views/home_screen/home_screen.dart';
import 'package:e_commerce_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override

  Widget build(BuildContext context) {
    var controller=Get.put(HomeController());

    var navbarItem=[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26),label: account)
    ];

    var navBody =[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
    ];
    return Scaffold(

      body: Column(
        children: [
          Obx(() => Expanded(
            child: navBody.elementAt(controller.currentNavIndex.value),
          )),

        ],
      ),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          items:navbarItem,
          currentIndex: controller.currentNavIndex.value ,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          onTap: (value){
            controller.currentNavIndex.value=value;
          },

          // unselectedItemColor: fontGrey,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
        ),
      ),
    );
  }
}
