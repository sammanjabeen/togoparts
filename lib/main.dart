import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'more_tab.dart';


void main() {
  runApp(MyWebViewWidget());

}



class MyWebViewWidget extends StatefulWidget {

  @override
  State<MyWebViewWidget> createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget> {

  List<String> urls = <String>[
    "https://www.togoparts.com/?fbclid=IwAR2Qq9yvRk10zIanmQ3dGqImQ9Q7AfiabmvtRgbKY9vK2snCEbA7MsEylT8",
    "https://www.togoparts.com/bikeprofile/trides?fbclid=IwAR1XvzsxRjnKkEHCOsFIqCduZqVYwl_ITO-IUk6X6FPWyDMFjswg3ba4R88",
    "https://www.togoparts.com/marketplace/browse?fbclid=IwAR21bwY_RtFQiduMuJzU12zdZN3hJN0MTjNPuY1xQY6ByvqsXmmLld0kFSw",
    "https://www.togoparts.com/marketplace/create/?fbclid=IwAR0qLNY9PhZeiBNQS0bsTYO7ra6l1LB-4flV7GZZoTFDsnDani7EKAc9hbA",
    "https://www.togoparts.com/bikeprofile/trides"
  ];
  late WebViewController controller;
  int selectedIndex = 0;
  late bool b = true;



  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (a) {
        debugPrint("page start loading!");
      }, onProgress: (a) {
        debugPrint("Page laoding in progress");
      }, onPageFinished: (a) {
        Navigator.pop(context);
        debugPrint("page loading finished!");
      }));
    controller.loadRequest(Uri.parse(urls[selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("TogoParts",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: b
                ? WebViewWidget(controller: controller)
                :  MoreTab(),

          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.yellow[700],
            selectedLabelStyle: TextStyle(color: Colors.yellow[700]),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.motorcycle), label: "Ride",backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "MarketPlace",backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Post Ad",backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More", backgroundColor: Colors.black)
            ],
            onTap: (currentIndex) {
              setState(() {
                selectedIndex=currentIndex;
                controller.loadRequest(Uri.parse(urls[selectedIndex]));
                if (currentIndex == 4) {
                  b = false;
                } else {
                  b = true;
                }
              });
            },
          ),
      ),
    );
  }
}