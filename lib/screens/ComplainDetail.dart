import 'dart:html';

import 'package:adminportalcitizen/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class ComlainDetails extends StatefulWidget {
  const ComlainDetails({Key key}) : super(key: key);

  @override
  _ComlainDetailsState createState() => _ComlainDetailsState();
}

class _ComlainDetailsState extends State<ComlainDetails> {
  @override
  var _selectregion;
  Widget build(BuildContext context) {
    bool isChecked = false;
    final TrackingID =Text('9943');
    final Categories =Text('Tree Falling');
    final City =Text('karachi');
    final Description =Text('Tree Fallen Near xxyz');
    final CellNumber =Text('030404836');
    final Cnic =Text('4200-378474-1');
    final Locationn =Text('Http//lat:975468970877,lang:-0.645558765875');
    final RegionSelect =Text('east');
    final Imagee =Text('Http//image.12336-2-40p');

    final SaveButton = Container(
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
        child: Text('Save',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final RegionDropDown = DropdownButton<String>(
      hint: Text(
          'Status'), // Not necessary for Option 1
      value: _selectregion,
      items: <String>[
        'Rejected Complains',
        'Under Process',
        'Escelated',

      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectregion = newValue;
        });
      },



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
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.2,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 42.0),
                    Center(
                        child: Text(
                          "Citizen Complains",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(height: 48.0),
                    Row(
                      children: [
                        Text('Tid'),
                        Spacer(),
                        TrackingID,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Category'),
                        Spacer(),
                        Categories,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('City'),
                        Spacer(),
                        City,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Description'),
                        Spacer(),
                        Description,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Cell-Number'),
                        Spacer(),
                        CellNumber,
                      ],
                    ),
                    SizedBox(height: 8.0), SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Location Link'),
                        Spacer(),
                        Locationn,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Image'),
                        Spacer(),
                        Imagee,
                      ],
                    ),

                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Cnic'),
                        Spacer(),
                        Cnic,
                      ],
                    ),
                    SizedBox(height: 8.0),
                    RegionDropDown,
                    SizedBox(height: 8.0),



                   SaveButton,
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
