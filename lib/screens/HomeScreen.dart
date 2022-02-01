import 'package:adminportalcitizen/Lists/Compains.dart';
import 'package:adminportalcitizen/Lists/Slide.dart';
import 'package:adminportalcitizen/Lists/complainlist.dart';
import 'package:adminportalcitizen/screens/Feedback.dart';
import 'package:adminportalcitizen/screens/login2.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';


import 'ComplainDetail.dart';
import 'Settings.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
   TabController tabController;


  void initState() {
    super.initState();


  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: CircleAvatar(backgroundColor: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit_outlined),
              title: const Text('Dashboard (East)'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings_outlined),
              title: const Text('Setting'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Settings()),
                );
              },
            ),  ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => feedback()),
                );
              },
            ),ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text('Signout'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Login()),
                );
              },
            ),
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Admin!',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 27),
                      ),
                      Text(
                        'Dashboard (East)',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ), //welcomeAdmin
                Container(
                  //color: Colors.grey,
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: slideList.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 5, bottom: 6),
                          child: Container(

                            height: 100,
                            width: MediaQuery.of(context).size.width/4.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 17.0,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(slideList[index].image),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          slideList[index]
                                              .amount
                                              .toString(),
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        Spacer(),
                                        Text(slideList[index].destination),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 300,

                width: MediaQuery.of(context).size.width/1.1,
                child:  Expanded(

                  child:
                  ListView.builder(
                      padding: EdgeInsets.all(9),
                      itemCount: Complain_List.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          height: 150,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComlainDetails()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 400,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black
                                    // gradient: LinearGradient(colors: [
                                    //   Colors.black,
                                    //  Colors.grey,
                                    // ])),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "TID :",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            Complain_List[index].destination??
                                                'null',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            "Name :",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            Complain_List[index].navigation ??
                                                'null',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            "Time :",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                                'yyyy-MM-dd',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Spacer(),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
              SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'This is a footer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}
