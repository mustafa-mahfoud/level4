import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:level4/firebase_options.dart';
import 'package:level4/responsef/mobile.dart';
import 'package:level4/responsef/responsef.dart';
import 'package:level4/responsef/web.dart';
import 'package:level4/screen/Home.dart';
import 'package:level4/screen/signin.dart';
import 'package:level4/screen/signup.dart';
import 'package:level4/sheard/SnackBar.dart';

//flutter run -d chrome
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDZly-FnQGOGe6-iy3htaqT5oE7GRuJAM0",
        authDomain: "instgram-181b5.firebaseapp.com",
        projectId: "instgram-181b5",
        storageBucket: "instgram-181b5.firebasestorage.app",
        messagingSenderId: "89991785385",
        appId: "1:89991785385:web:997bd9be695f5993ebb2b8",
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //home: Signin(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return showSnackBar(context, "Something went wrong");
          } else if (snapshot.hasData) {
            return responsef(mobilescreen: Mobile(), webscreen: web());
          } else {
            return Signin();
          }
        },
      ),
    );
  }
}
