import 'dart:io';
import 'dart:math' show Random, e;
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:level4/responsef/mobile.dart';
import 'package:level4/responsef/responsef.dart';
import 'package:level4/responsef/web.dart';
import 'package:level4/Firbase_Servics/Auth.dart';

import 'package:level4/Firbase_Servics/image_packer.dart';
import 'package:level4/screen/Home.dart';
import 'package:level4/screen/signin.dart';
import 'package:level4/sheard/MyTextfalid.dart';
import 'package:level4/sheard/SnackBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool chngePassweord = false;
  bool chngenumber = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  // String? imgName;

  ischngedPassweord(String emil) {
    if (emil.contains(RegExp(r'.{8,}'))) {
      chngePassweord = true;
    } else {
      chngePassweord = false;
    }
    if (emil.contains(RegExp(r'[0-9]'))) {
      chngenumber = true;
    } else {
      chngenumber = false;
    }
    if (emil.contains(RegExp(r'[A-Z]'))) {
      hasUppercase = true;
    } else {
      hasUppercase = false;
    }
    if (emil.contains(RegExp(r'[a-z]'))) {
      hasLowercase = true;
    } else {
      hasLowercase = false;
    }
    if (emil.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      hasSpecialCharacters = true;
    } else {
      hasSpecialCharacters = false;
    }
  }

  // ...existing code...

  bool visibility = true;
  final _formKey = GlobalKey<FormState>();
  bool valu = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final titleController = TextEditingController();
  final imagePacker = ImagePacker();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: mygreen,
          title: const Text(
            "Sign up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          //await uploadImage();
                        },
                        child: imagePacker.imgPath == null
                            ? const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage(
                                  "assets/image/Profile_avatar_placeholder_large.png",
                                ),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: MemoryImage(
                                  imagePacker.imgPath!,
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: widthScreen > 600 ? -12 : -15,
                        right: widthScreen > 600 ? -14 : -14,
                        left: widthScreen > 600 ? 105 : null,
                        child: IconButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(22),
                                    height: 200,
                                    width: widthScreen > 600 ? 300 : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            Navigator.pop(context);

                                            await imagePacker.uploadImage(
                                              ImageSource.camera,
                                            );
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await imagePacker.uploadImage(
                                              ImageSource.gallery,
                                            );
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.abc,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            //Navigator.pop(context);
                          },
                          icon: const Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen > 600 ? widthScreen / 4.0 : 0,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        MyTextfalid(
                          suffixIcon: const Icon(Icons.person),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                         if (value == null || value.trim().isEmpty) {
                           return "Username cannot be empty";
                          }                          
                  return null;
             },
                          onChanged: (username) {},
                          //   return value != null && !EmailValidator.validate(value)
                          //       ? "Enter a valid email"
                          //       : null;
                          // },
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          hintText: "Enter Your username",
                        ),
                        const SizedBox(height: 30),
                        MyTextfalid(
                          suffixIcon: const Icon(Icons.accessibility),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (valu) {},
                          onChanged: (username) {},
                          //   return value != null && !EmailValidator.validate(value)
                          //       ? "Enter a valid email"
                          //       : null;
                          // },
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          hintText: "Enter Your age",
                        ),
                        const SizedBox(height: 30),
                        MyTextfalid(
                          suffixIcon: const Icon(Icons.home),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (valu) {},
                          onChanged: (username) {},
                          //   return value != null && !EmailValidator.validate(value)
                          //       ? "Enter a valid email"
                          //       : null;
                          // },
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          hintText: "Enter Your title",
                        ),
                        const SizedBox(height: 30),
                        MyTextfalid(
                          onChanged: (emil) {},
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.email),
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.contains(
                                  RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                  ),
                                )
                                ? null
                                : "Enter a valid email";
                          },
                          hintText: "Enter Your Email",
                        ),
                        const SizedBox(height: 30),
                        MyTextfalid(
                          onChanged: (password) {
                            setState(() {
                              ischngedPassweord(password);
                            });
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: visibility
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.contains(RegExp(r'.{8,}')) &&
                                    value.contains(RegExp(r'[A-Z]')) &&
                                    value.contains(RegExp(r'[0-9]')) &&
                                    value.contains(RegExp(r'[a-z]')) &&
                                    value.contains(
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                    )
                                ? null
                                : "Enter a valid Password";
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: visibility,
                          hintText: "Enter Your Password",
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.check, color: Colors.white),
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: chngePassweord
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "At least 8 characters ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.check, color: Colors.white),
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: chngenumber
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "At least 1 number ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.check, color: Colors.white),
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: hasUppercase
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Has Uppercase ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.check, color: Colors.white),
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: hasLowercase
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Has Lowercase ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.check, color: Colors.white),
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: hasSpecialCharacters
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Has SpecialCharacters",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          valu = false;
                        });
                        await Auth().signup(
                          emailll: emailController.text,
                          passworddd: passwordController.text,
                          context: context,
                          full_name111: nameController.text,
                          age111: ageController.text,
                          title111: titleController.text, folloers: [], folloing: [],
                        );
                        setState(() {
                          valu = true;
                        });
                    
                      } else {
                        print("=============================");
                        showSnackBar(context, "Error");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(143, 3, 118, 7),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.all(12),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: valu
                        ? const Text(
                            "Register",
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )
                        : const CircularProgressIndicator(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signin(),
                            ),
                          );
                        },
                        child: const Text(
                          'sign in',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
