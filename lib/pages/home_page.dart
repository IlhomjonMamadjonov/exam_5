import 'package:exam_5/pages/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
  ];

  List titlesOfAvatar = ["Beauty", "Cleaning", "Car Washing", "Physics","Beauty", "Cleaning", "Car Washing", "Physics"];
  List<Icon>iconsOf=[
    Icon(Icons.local_car_wash),
    Icon(Icons.beach_access),
    Icon(Icons.dry_cleaning),
    Icon(Icons.beach_access),
    Icon(Icons.local_car_wash),
    Icon(Icons.beach_access),
    Icon(Icons.dry_cleaning),
    Icon(Icons.beach_access),
  ];

  List title1=[
    "Plumbing Service",
    "Home Cleaning Service",
    "Plumbing Service",
    "Home Cleaning Service","Plumbing Service",
    "Home Cleaning Service",
  ];
  List title2=[
    "UP TO 40% OFF",
    "Flat 25% OFF",
    "UP TO 40% OFF",
    "Flat 25% OFF",
    "UP TO 40% OFF",
    "Flat 25% OFF",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search your service",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.red.shade300,
        leading: Icon(
          Icons.location_on_outlined,
          color: Colors.white,
        ),
        title: Text(
          "Florida, USA",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [Icon(Icons.filter_list_alt)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// First Part list view
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, i) {
                    return first_part(context, i);
                  }),
            ),
            SizedBox(
              height: 15,
            ),

            /// Writings
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Services",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  Text(
                    "View More",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ),
            /// Second listView
            Container(
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, i) {
                    return secondListView(context, i);
                  }),
            ),
            SizedBox(height: 15,),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(itemCount: images.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,i){
                    return third_part(i);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Card third_part(int i) {
    return Card(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              child: Image.asset(
                                images[i],
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(width: 10,),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text(title1[i],style: TextStyle(color: Colors.black),), SizedBox(height: 10,),Text(title2[i],style: TextStyle(color: Colors.red),)],
                            )),
                      ],
                    ),
                  );
  }

  Column secondListView(BuildContext context, int i) {
    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(SecondPage.id);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Container(
                                height: 70,
                                width: 70,
                                color: i.isEven
                                    ? Colors.blue.shade100
                                    : Colors.pink.shade100,
                                child: iconsOf[i],
                              ),
                            ),
                          ),
                        ),
                        Text(titlesOfAvatar[i])
                      ],
                    );
  }

  Container first_part(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height * 0.31,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image:
              DecorationImage(image: AssetImage(images[i]), fit: BoxFit.cover)),
    );
  }
}
