import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_slicing_assignment/Controller/NavBarController.dart';
import 'package:ui_slicing_assignment/pages/menus/LibraryMenu.dart';
import 'package:ui_slicing_assignment/pages/menus/SearchMenu.dart';
import 'package:ui_slicing_assignment/pages/menus/Test.dart';
import 'Menus/HomeMenu.dart';

class home extends StatelessWidget {
  home({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.find();
    final List<Widget> indexNavigator = [HomeMenu(), SearchMenu(), LibraryMenu()];
    final List<String> listIcon = ['assets/home2.svg','assets/search2.svg','assets/library.svg'];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: indexNavigator[navBarController.selectedIndex.value],
        bottomNavigationBar: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: double.infinity),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: indexNavigator.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => navBarController.selectedIndex(index),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom: index == navBarController.selectedIndex.value
                                  ? 0
                                  : 10,
                              right: 10,
                              left: 10,
                            ),
                            width: 60,
                            height:
                                index == navBarController.selectedIndex.value ? 5 : 0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            listIcon[index],
                            color: index == navBarController.selectedIndex.value
                                ? Colors.white
                                : Color(0x50ffffff)
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      // return Scaffold(
      //   body: indexNavigator[navBarController.selectedIndex.value],
      //   bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Theme.of(context).colorScheme.primary,
      //     currentIndex: navBarController.selectedIndex.value,
      //     onTap: navBarController.changeMenuTo,
      //     items: const [
      //        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Search"),
//              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Library"),
      //     ],
      //   ),
      // );
    });
  }
}
