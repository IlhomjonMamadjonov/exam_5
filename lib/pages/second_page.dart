import 'package:exam_5/models/experts.dart';
import 'package:exam_5/pages/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const String id = "/second_page";

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List typesCleaning = [
    "Kitchen Cleaning",
    "Room Cleaning",
    "Garden Cleaning",
    "Kitchen Cleaning",
    "Room Cleaning",
    "Garden Cleaning",
  ];

  List imagesClean = [
    "assets/cleaning/1.jpg",
    "assets/cleaning/2.jpg",
    "assets/cleaning/3.jpg",
    "assets/cleaning/4.jpg",
    "assets/cleaning/5.jpg",
    "assets/cleaning/1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
          )
        ],
        title: Text(
          "Cleaning Services",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// First Part
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: imagesClean.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return first_part(i);
                  }),
            ),

            /// Writings
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experts",
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
            SizedBox(
              height: 15,
            ),

            ///Second Part LitVIew
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: Lists().elements.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return second_part(person: Lists().elements[i]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Card second_part({People? person}) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  child: Image.asset(
                    person!.image!,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.name!,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        person.profession!,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Rating",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(person.rating!.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Jobs",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                person.jobs!.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Rate",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(person.rate!.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Column first_part(int i) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              imagesClean[i],
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(typesCleaning[i])
      ],
    );
  }
}
