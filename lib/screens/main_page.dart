import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';
import '../widgets/bottom_bar.dart';
import 'book_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: getBottomBar(),
      body: getMainPage(),
    );
  }

  Widget getMainPage() {
    return Container(
      decoration: BoxDecoration(color: bottomBarColor),
      child: Container(
        decoration: BoxDecoration(
            color: appBgColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(80))),
        child: IndexedStack(
          index: activeTab,
          children: [
            HomePage(),
            BookPage(),
            Center(
              child: Text(
                "Setting",
                style: TextStyle(fontSize: 35.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 8.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(100),
        ),
        color: bottomBarColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 0;
              });
            },
            child: BottomBar(Icons.home, "",
                isActive: activeTab == 0, activeColor: secondary),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 0;
              });
            },
            child: BottomBar(Icons.library_books, "",
                isActive: activeTab == 0, activeColor: secondary),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 0;
              });
            },
            child: BottomBar(Icons.settings, "",
                isActive: activeTab == 0, activeColor: secondary),
          ),
        ]),
      ),
    );
  }
}
