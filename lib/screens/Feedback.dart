import 'package:adminportalcitizen/Lists/complainlist.dart';
import 'package:adminportalcitizen/layout_utility/Dilogbox.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'HomeScreen.dart';

class feedback extends StatefulWidget {
  const feedback({Key key}) : super(key: key);

  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {


    final loginButton = Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 2.5,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.black,
        child: Text('OK ',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white12,
              ),
            ],
          ),
          Center(
            child: Card(
              elevation: 2.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(42),
                width: MediaQuery.of(context).size.width / 2.4,
                height: MediaQuery.of(context).size.height / 1.2,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 22.0),
                    Center(
                        child: Text(
                          "Feedback",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(height: 8.0),
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
                                        MaterialPageRoute(builder: (context) => Homepage()),
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
                                                    "Name :",
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
                                                    "Email :",
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
                                                    "Description :",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap:(){
                                                      Alert(
                                                        context: context,
                                                        type: AlertType.info,
                                                        title: "Name ",
                                                        desc: "Feedback\n uyckuayb \nygcbkuyak \ncbgakafyan \naygcuoayun",
                                                        buttons: [
                                                          DialogButton(
                                                            child: Text(
                                                              "OK",
                                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                                            ),
                                                            onPressed: (){
                                                              // Data.qname ="";
                                                              // Data.qemail = "";
                                                              // Data.qdescription ="";
                                                              Navigator.pop(context);

                                                            },
                                                            width: 120,
                                                            radius: BorderRadius.circular(20.0),

                                                          )
                                                        ],
                                                      ).show();
                                                    },
                                                    child: Text(
                                                      'More view',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold),
                                                    ),
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

                    SizedBox(height: 18.0),
                    loginButton,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
