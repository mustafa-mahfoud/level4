// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class responsef extends StatefulWidget {
  final mobilescreen;

  final webscreen;
  const responsef({
    super.key,
    required this.mobilescreen,
    required this.webscreen,
  });
  @override
  State<responsef> createState() => _responsefState();
}

class _responsefState extends State<responsef> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext, BoxConstraints) {
        if (BoxConstraints.maxWidth > 600) {
          return widget.webscreen;
        } else {
          return widget.mobilescreen;
        }
      },
    );
  }
}
