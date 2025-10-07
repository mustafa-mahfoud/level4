// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:level4/sheard/colors.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("instagram",style: TextStyle(fontFamily: "Schyler2"),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.white,)),

        ],
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape:BoxShape.circle ,
                          border: Border.all(color: Colors.green,width: 3)
                        ),
                        child: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1542038784456-1ea8e935640e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",),
                        radius:30 ,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("mustafa mahfoud",style: TextStyle(color: Colors.white,fontSize: 15),)
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,),color: Colors.white,)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 275,
            child: Image.network("https://as2.ftcdn.net/v2/jpg/02/97/26/43/1000_F_297264348_bFuh1hC3rmHydE0BX2V8qxsA8LHj2ZpU.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),color: primaryColor),
                    IconButton(onPressed: (){}, icon: Icon(Icons.message),color: primaryColor,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.send),color: primaryColor,),
            
            
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border),color: primaryColor,),
              ],
            ),
          ),
          Container(
          padding: EdgeInsets.only(left: 19),
            width: double.infinity,
            child: Text("10 likes",textAlign: TextAlign.left,)),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Row(
              children: [
                   Text("mustafa mahfoud",style: TextStyle(color: primaryColor),),
                   SizedBox(width: 12,),
                   Text("this in syria 🧡",style: TextStyle(color: primaryColor),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Container(
              width: double.infinity,
              child: GestureDetector(
                onDoubleTap: (){},
                child:  Text("view all 100 comments",
                  style: TextStyle(color: blueColor),       )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 21.0),
            child: Container(
              width: double.infinity,
              child: Text("7 October 2025",
                style: TextStyle(),       ),
            ),
          ),
        ],
      ) ,

    );
  }
}