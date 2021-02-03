import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_flutter/page/dashboard/dashboardData.dart';

class DashboardCarousel extends StatelessWidget {
  List imgList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        initialPage: 0,
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
              decoration: BoxDecoration(color: Colors.blue),
              child: Image.asset(
                i,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double cardRadius = MediaQuery.of(context).size.width / 5;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DashboardCarousel(),
        FutureBuilder<dashboardData>(
          future: dashboardData().dashboardApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.student,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Student",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.teacher,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Teacher",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.section,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Section",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                    thickness: 3,
                    color: Colors.black26,
                  ),
                  Text(
                    'Seat Status',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  Divider(
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                    thickness: 3,
                    color: Colors.black26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.totalSeat,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.bookedSeat,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Booked",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            elevation: 20.0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.white70, width: 2)),
                            shadowColor: Colors.black,
                            child: Container(
                                alignment: Alignment.center,
                                height: cardRadius,
                                width: cardRadius,
                                child: FittedBox(
                                  child: Text(
                                    snapshot.data.availableSeat,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                )),
                          ),
                          Text(
                            "Available",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                alignment: Alignment.center,
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 70,
                ),
              );
            }
          },
        ),
      ],
    ));
  }
}
