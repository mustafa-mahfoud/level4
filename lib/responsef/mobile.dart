import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:level4/screen/Home.dart';
import 'package:level4/screen/add.dart';
import 'package:level4/screen/favorite.dart';
import 'package:level4/screen/profile.dart';
import 'package:level4/screen/search.dart';
import 'package:level4/sheard/colors.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  final PageController _pageController = PageController();
  int? index;
  int v0 = 0;
  int v1 = 0;
  int v2 = 0;
  int v3 = 0;
  int v4 = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          // navigate to the tabed page
          _pageController.jumpToPage(index);
          setState(() {
            v0 = index;
            v1 = index;
            v2 = index;
            v3 = index;
            v4 = index;
          });
        },
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(  
            icon: Icon(
              Icons.home,
              color: v0 == 0 ? primaryColor : secondaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: v1 == 1 ? primaryColor : secondaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: v2 == 2 ? primaryColor : secondaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: v3 == 3 ? primaryColor : secondaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: v4 == 4 ? primaryColor : secondaryColor,
            ),
            label: "",
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          
          print("======================$index");
        },
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [Home(), search(), add(), favorite(), profile()],
      ),
    );
  }
}
