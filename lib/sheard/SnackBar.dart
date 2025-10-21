import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text, ) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(days: 1),
    content: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 17),
    ),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: Colors.red, width: 4),
    ),
    action: SnackBarAction(label: "close", onPressed: () {},textColor: Colors.red,),
  ));
}
