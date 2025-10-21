import 'package:flutter/material.dart';
import 'package:level4/screen/Home.dart';
import 'package:level4/screen/add.dart';
import 'package:level4/screen/favorite.dart';
import 'package:level4/screen/profile.dart';
import 'package:level4/screen/search.dart';
import 'package:level4/sheard/colors.dart';

class web extends StatefulWidget {
  const web({super.key});

  @override
  State<web> createState() => _webState();
}

class _webState extends State<web> {
  final PageController _pageControllerweeb = PageController();
  int c = 0;
  @override
  void dispose() {
    _pageControllerweeb.dispose();
    super.dispose();
  }

  jumpToPage(int index) {
    _pageControllerweeb.jumpToPage(index);
    setState(() {
      c = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: webBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            color: c == 0 ? primaryColor : secondaryColor,
            onPressed: () {
              jumpToPage(0);
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            color: c == 1 ? primaryColor : secondaryColor,
            onPressed: () {
              jumpToPage(1);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            color: c == 2 ? primaryColor : secondaryColor,
            onPressed: () {
              jumpToPage(2);
            },
            icon: Icon(Icons.camera_alt),
          ),
          IconButton(
            color: c == 3 ? primaryColor : secondaryColor,
            onPressed: () {
              jumpToPage(3);
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            color: c == 4 ? primaryColor : secondaryColor,
            onPressed: () {
              jumpToPage(4);
            },
            icon: Icon(Icons.person),
          ),
        ],
        title: Text("instagram", style: TextStyle(fontFamily: "Schyler2")),
        backgroundColor: Colors.black,
      ),
      body: PageView(
        onPageChanged: (index) {
          print("======================$index");
          // _pageControllerweeb.jumpToPage(index);
        },
        physics: NeverScrollableScrollPhysics(),
        controller: _pageControllerweeb,
        children: [Home(), search(), add(), favorite(), profile()],
      ),
    );
  }
}
