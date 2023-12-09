import 'package:flutter/material.dart';
import 'package:instagram_clone_ieee/search_page.dart';
import 'home.dart';
import 'search_page.dart';
import 'profile_page.dart';


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  int currentState = 0;

  @override
  List <Widget> widgets = [
    home(),
    search_page(),
    profile_page(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Color.fromRGBO(51,51,51,1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        onTap: (index){
          setState(() {
            currentState=index;
          });

        },
        enableFeedback: false,
        currentIndex: currentState,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home1.png",height: 30,width: 30,),
            label : "",

          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/search2.png",height: 30,width: 30,),
            label :"",
            backgroundColor: Colors.grey,

          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/profile1.png",height: 30,width: 30,),
            label :"",
            backgroundColor: Colors.grey,

          ),

        ],
        showUnselectedLabels: false ,

      ),
      body: IndexedStack(children: widgets,index: currentState,),
      backgroundColor: Color.fromRGBO(51,51,51,1),

    );
  }
}
