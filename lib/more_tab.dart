
import 'package:flutter/material.dart';




class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  List<String> options = ["Rides",
    "Magazine",
    "Forum",
    "Bike Shops",
    "Careers",
    "Advertise with us",
    "About us",
    "Terms of Service"];
  List<Widget> icons =<Widget> [
    Image.asset("assets/icons/rides_icon@2x.png"),
    Image.asset("assets/icons/magazine_icon@2x.png"),
    Image.asset("assets/icons/forum_icon@2x.png"),
    Image.asset("assets/icons/bike_shops_icon@2x.png"),
    Image.asset("assets/icons/careers_icon@2x.png"),
    Image.asset("assets/icons/advertise_icon@2x.png"),
    Image.asset("assets/icons/about_icon@2x.png"),
    Image.asset("assets/icons/terms_services_icon@2x.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("More"),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset("assets/icons/downArrow_icon@1x.png")),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: (){}, icon: Icon(Icons.mark_as_unread_sharp)),
          PopupMenuButton(
            iconSize: 30.0,
            icon: Icon(Icons.more_vert),
            position: PopupMenuPosition.under,
            onSelected: (item) => (context, item),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Settings",
                      style: TextStyle(fontSize: 20),
                    )),
                PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      "Swtch Country",
                      style: TextStyle(fontSize: 20),
                    )),
                PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 20),
                    )),
              ];
            },),
        ],
      ),
      body: ListView.builder(
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(options[index]),
                    leading: icons[index] ,
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
