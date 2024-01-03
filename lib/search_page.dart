import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  late ConnectivityResult _connectivityResult;
  @override
  void initState() {
    super.initState();

    // Initialize connectivity and listen for changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });

    // Get the initial network state
    Connectivity().checkConnectivity().then((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Center(
            child: Wrap(
              children: [
                SizedBox(
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

                SizedBox(
                  child: CachedNetworkImage(
                    imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/ieee-mobile-project-adc08.appspot.com/o/7058958babbef754f683c4201b3be761.jpg?alt=media&token=f68a0e01-4b9e-403d-b07d-3726c6e779c9',
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(child: Text('Network Status: $_connectivityResult',style: const TextStyle(color: Colors.white),)),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(child:IconButton(
                    onPressed: () { setState(() {
                      
                    });}, icon: const Icon(Icons.add_box_rounded,color: Colors.white,size: 100),

                  )),
                ),

              ],
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(51,51,51,1),
    );
  }
}