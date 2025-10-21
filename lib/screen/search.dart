import 'package:flutter/material.dart';
import 'package:level4/sheard/colors.dart';
class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: InputDecoration(
            hintText: "Search for a user ...",
            border: InputBorder.none
          ),
        )
      ),
    );
  }
}