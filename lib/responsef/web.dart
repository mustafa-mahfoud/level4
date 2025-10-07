import 'package:flutter/material.dart';

class web extends StatefulWidget {
  const web({super.key});

  @override
  State<web> createState() => _webState();
}

class _webState extends State<web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
      
        Text ("web screen"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}