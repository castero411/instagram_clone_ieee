import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 120),

          Center(
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/ieee-mobile-project-adc08.appspot.com/o/giphy.jpg?alt=media&token=3395756d-f1cb-4928-8a2e-c209bc737a08',
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          const SizedBox(height: 200,),
          MaterialButton( height: 100,enableFeedback: false, onPressed: (){
            setState(() {

            });},child: const Text("welcome") ,

          )

        ],
      ),
      backgroundColor: const Color.fromRGBO(51,51,51,.5),
    );
  }
}

