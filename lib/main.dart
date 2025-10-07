
import 'package:flutter/material.dart';
import 'package:level4/responsef/mobile.dart';
import 'package:level4/responsef/responsef.dart';
import 'package:level4/responsef/web.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: responsef(
        mobilescreen:Mobile(),
        webscreen:web()
        
        
        )
    
      
    );
  }
}