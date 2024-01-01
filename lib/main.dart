import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ieee/home.dart';
import 'package:instagram_clone_ieee/home_page.dart';
import 'package:instagram_clone_ieee/login_page.dart';
import 'package:instagram_clone_ieee/register_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
// Correct constructor declaration

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int index = 0;

  @override
  void initState(){
    FirebaseAuth.instance.authStateChanges().listen((User? user){});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:home_page(),//TODO change it to login
        title: "The page",
        debugShowCheckedModeBanner: false,

        routes: {

          "/register":(context) => register_page(),
          "/login":(context)=> login_page(),
          "/homePage":(context)=> home_page(),
        });
  }
}




