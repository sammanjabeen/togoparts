import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyWebViewWidget(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:Center(
            child: Column(

              children: [
                Container(height: 200,),
                Image.asset("assets/icons/splash_logo@2x.png",width: 250,),
                Container(height: 200,),
                Text("www.togoparts.com",style: TextStyle(fontSize: 20,color: Colors.orange),),
                Container(height: 35,),
                Text("Singapore's Most Addictive Bicycle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),),
                Container(height: 5,),
                Text("Marketplace",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),),

              ],
            ),
          )
      );
  }
}
