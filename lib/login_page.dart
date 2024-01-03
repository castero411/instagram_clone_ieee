
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  TextEditingController usernameEmail= TextEditingController();
  TextEditingController password= TextEditingController();
  int errorcode = 0;
  String error = "";

  Future<void> login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameEmail.text,
          password: password.text,
      );
      setState(() {
        error = "";
      });
      Navigator.of(context).pushReplacementNamed("/homePage");

    } on FirebaseAuthException catch (e) {
      if(usernameEmail.text=="") {//error code 1 -> no email
          setState(() {
              error = "please enter your Email";
              errorcode=1;
          });
        } else if(password.text=="") {//error code 2 -> no password
        setState(() {
          error = "please enter your password";
          errorcode=2;
        });
      } else if(e.code == "invalid-email"){
        setState(() {
          error = "please enter a registered email";
        });
      } else if(e.code == "invalid-password"){
        setState(() {
          error = "please enter a registered email";
        });
      }
      print(e.code);


    }
  }

  //TODO create suffixIcon: to control obscurity of the password field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              const SizedBox(height: 130) ,
              Image.asset("assets/text_logo.png",height: 100,),
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
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80,80,80,1))),
                  ),
                  onTap: (){setState(() {
                    error = "";
                    errorcode =0;
                  });},
                  controller: usernameEmail ,
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
                  onTap: (){setState(() {
                    error = "";
                    errorcode =0;
                  });},
                  controller: password,
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(right:32),
                child: const Text("Forgotten password?",style: TextStyle(color: Color.fromRGBO(
                    35, 154, 246, 1.0),fontSize: 15 ),textAlign: TextAlign.right ,  ),
              ),
              const SizedBox(height: 15,),
              Container(
                alignment: Alignment.center,
                child: Text(error,textAlign: TextAlign.center,style: const TextStyle(fontSize: 15,color: Colors.red),),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left:30,right: 30),
                child: MaterialButton(onPressed: (){login();},
                  color: const Color.fromRGBO(35, 154, 246, 1.0),textColor: Colors.white,
                child: const Text("Log In"),),
              ),
              const SizedBox(height: 160,),
              const Divider(height: 80,color: Color.fromRGBO(140,140,140,1),),

                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30,left: 30),
                    alignment: Alignment.center,
                    child: const Text.rich(TextSpan (children:[
                      TextSpan(text: "Don't have account?  ",style: TextStyle(color: Colors.white)),
                      TextSpan(text: "Sign Up", style: TextStyle(color: Color.fromRGBO(35, 154, 246, 1.0)),),
                        ],
                    ),
                    ),
                  ),
                  onTap:(){
                    Navigator.of(context).pushReplacementNamed("/register");
                  },
                ),
            ],
          ),
      ),
      backgroundColor: const Color.fromRGBO(51,51,51,1),
    );
  }
}
