import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register_page extends StatefulWidget {
  const register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  int errorCode =0;

  void register() async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.of(context).pushReplacementNamed("/homePage");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code=="The email address is badly formatted"){

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (email.text==""&&password.text==""){
        print("both empty parameters");
      } else if (password.text==""){
        print("password empty parameters");
      } else if (email.text==""){
        print("email empty parameters");
      }
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [


            const SizedBox(height: 60) ,
            Image.asset("assets/text_logo.png",height: 100,),
            const SizedBox(height: 30,),

            Container(
                alignment: Alignment.center,
                child: const Text("Sign up to save photos and videos\nfrom your friends.",style:TextStyle(fontSize: 16,color: Color.fromRGBO(170, 170,170, 1)),textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 30,),

            Container(
              margin: const EdgeInsets.only(left:30,right:30),
              child: TextFormField(
                style: const TextStyle(fontSize: 17,color: Colors.white,height: 1),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(110, 110, 110, 1))),
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Color.fromRGBO(90,90,90,1)),
                  filled: true,
                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                  border: OutlineInputBorder(),

                ),
                controller: email,
              ),
            ),


            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left:30,right:30),
              child: TextFormField(
                style: const TextStyle(fontSize: 17,color: Colors.white,height: 1),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(110, 110, 110, 1))),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Color.fromRGBO(90,90,90,1)),
                  filled: true,
                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                  border: OutlineInputBorder(),

                ),
                controller: password,
              ),
            ),
            const SizedBox(height: 60,),
            Container(
              height: 40,
              margin: const EdgeInsets.only(left:30,right: 30),
              child: MaterialButton(onPressed: (){
                setState(() {
                  register();
                });
              },color: const Color.fromRGBO(35, 154, 246, 1.0),
                child: const Text("Sign Up"),textColor: Colors.white,),
            ),
            const SizedBox(height: 200,),
            const Divider(height: 60,color: Color.fromRGBO(140,140,140,1),),

            Container(
              margin: const EdgeInsets.only(right: 30,left: 30),
              alignment: Alignment.center,
              child: InkWell(
                child: const Text.rich(TextSpan (children:[
                  TextSpan(text: "Have account?  ",style: TextStyle(color: Colors.white)),
                  TextSpan(text: "Log In", style: TextStyle(color: Color.fromRGBO(35, 154, 246, 1.0))),
                ],
                ),
                ),
                  onTap: (){
                    setState(() {
                      Navigator.of(context).pushNamed("/login");
                            });
                    },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(51,51,51,1),
    );
  }
}

