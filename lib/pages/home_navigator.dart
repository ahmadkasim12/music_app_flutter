import 'package:flutter/material.dart';
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

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: indexNavigator[navBarController.selectedIndex.value],
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          height: 86,
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            itemCount: indexNavigator.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => InkWell(
              onTap: () => navBarController.selectedIndex(index),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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
                        index == navBarController.selectedIndex.value ? 50 : 0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: 16,
                    color: index == navBarController.selectedIndex.value
                        ? Colors.grey
                        : Colors.white,
                  ),
                  SizedBox(height: 20),
                ],
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

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.search,
    Icons.library_books,
  ];
}
