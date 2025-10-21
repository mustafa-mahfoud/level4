
//شو بيعمل هاد الكلاس

import 'package:flutter/material.dart';
class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("add"),
        
      ),
      body: Center (child: IconButton(onPressed: (){}, icon: Icon(Icons.upload,size: 70,))
      ),
    
      


    );
  }
}