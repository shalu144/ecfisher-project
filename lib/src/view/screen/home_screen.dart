import 'package:animations/animations.dart';

import 'package:ecfisher/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import '../../controller/product_controller.dart';
import 'allcatogry.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'all_product_screen.dart';
import 'profile_screen.dart';

final ProductController controller = Get.put(ProductController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    HomePage(),
    FavoriteScreen(),
   CatagoryListPage(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar:MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Home","Favorite", "Categoriea","Cart", "Profile",],
        icons: const [Icons.home,Icons.favorite,Icons.category_sharp,Icons.shopping_cart,Icons.person],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor:  Colors.white,
        tabIconSelectedColor:  AppColor.theme,
        tabBarColor: AppColor.theme,
        onTabItemSelected: controller.switchBetweenBottomNavigationItems,
      ),
      body: Obx(() {
        print(controller.currentBottomNavItemIndex.value);
        return PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[controller.currentBottomNavItemIndex.value],
        );
      }),
    );
  }
}
