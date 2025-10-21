// ignore_for_file: equal_keys_in_map

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:level4/screen/Home.dart';
import 'package:level4/sheard/SnackBar.dart';

class Auth {
  Uint8List? imgPath;
  signup({
    required emailll,
    required passworddd,
    required context,
    required full_name111,
    required age111,
    required title111,
    required folloers,
     required folloing,
  }) async {
    //String masege = "Erorr not started in the code";
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailll, password: passworddd);
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Home()));

      //masege = "Erorr regster only";
      // Use the user's UID as the document ID for uniqueness
      CollectionReference users = FirebaseFirestore.instance.collection(
        'usersss',
      );

      users
          .doc(credential.user?.uid)
          .set({
            'full_name': full_name111,
            'password': passworddd,
            'title': title111,
            'email': emailll,
            'age': age111,
            "folloers":[],
            "folloing":[]
            // Do NOT store plain passwords in Firestore for security reasons
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      //masege = "scusesfuly regster";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    //showSnackBar(context, masege);
  }

  signin({required emailll, required passworddd, required context}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailll,
        password: passworddd,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }
  }
}
