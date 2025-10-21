import 'package:flutter/material.dart';
import 'package:level4/Firbase_Servics/Auth.dart';
import 'package:level4/responsef/mobile.dart';
import 'package:level4/responsef/responsef.dart';
import 'package:level4/responsef/web.dart';
import 'package:level4/screen/signup.dart';
import 'package:level4/sheard/MyTextfalid.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:level4/sheard/SnackBar.dart';
import 'package:level4/sheard/colors.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool chngePassweord = false;
  bool chngenumber = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
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

  final _formKey = GlobalKey<FormState>();
  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  bool valu = true;
  bool isv = true;

  sin() async {
    setState(() {
      valu = false;
    });

    await Auth().signin(
      emailll: emilController.text,
      passworddd: passwordController.text,
      context: context,
    );

    setState(() {
      valu = true;
    });

    // showSnackBar(context, "successfully sign-in ☺");  if (!mounted) return;
  

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         const responsef(mobilescreen: Mobile(), webscreen: web()),
    //   ),
    // );
  }

  @override
  void dispose() {
    emilController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    //final google_sigun = Provider.of<GoogleSignInProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: mygreen,
          title: const Text(
            "Sign in",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthScreen > 600 ? widthScreen / 4 : 5,
                      ),
                      child: Column(
                        children: [
                          MyTextfalid(
                            onChanged: (password) {},
                            suffixIcon: Icon(Icons.email),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return value!.contains(
                                    RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ),
                                  )
                                  ? null
                                  : "Enter a valid email";
                            },
                            controller: emilController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            hintText: "Enter Your EmailAddress",
                          ),
                          const SizedBox(height: 30),
                          MyTextfalid(
                            onChanged: (password) {
                              setState(() {
                                ischngedPassweord(password);
                              });

                              //ischngedPassweord()
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isv = !isv;
                                });
                              },
                              icon: isv
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            obscureText: isv ? true : false,
                            hintText: "Enter Your Password",
                          ),
                          const SizedBox(height: 10),
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          sin();
                        } else {
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
                      child: valu?
                      const 
                      Text(

                        "Loig in",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ):CircularProgressIndicator()
                      //const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Reset()),
                        // );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(33, 150, 243, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(33, 150, 243, 1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do not have an account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ),
                            );
                          },
                          child: const Text(
                            'sign up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(33, 150, 243, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 299,
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 0.6, color: primaryColor),
                          ),
                          Text("OR", style: TextStyle(color: primaryColor)),
                          Expanded(
                            child: Divider(thickness: 0.6, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //                       GestureDetector(
                          //                         onTap: () async{
                          //                             showDialog(
                          // context: context,
                          // builder: (context) {
                          //   return const Center(child: CircularProgressIndicator());

                          // });

                          //     //await  google_sigun.googlelogin();

                          //                         Navigator.pop(context);
                          //                         },
                          //                         child: Container(
                          //                           padding: EdgeInsets.all(13),
                          //                           decoration: BoxDecoration(
                          //                               shape: BoxShape.circle,
                          //                               border: Border.all(
                          //                                 //  color: Colors.purple, width: 1
                          //                                   )
                          //                                   ),
                          //                           child: SvgPicture.asset(
                          //                             "assets/SVG/icons8-google.svg",
                          //                           //  color: Colors.purple[400],
                          //                             height: 27,
                          //                           ),
                          //                         ),
                          //                       ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
