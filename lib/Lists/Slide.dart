import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Slide {
  //var id;
  int amount;
  var destination;
  var image;

  Slide({
    //@required this.id,

    @required this.amount,
    @required this.destination,
    @required this.image,

  });
}

List<Slide> slideList = [
  Slide(
    //   id: 1,
    amount: 112,
    destination: 'New Complains',
    image:'assets/box.jpeg',
  ),
  Slide(
    //  id: 1,
    amount: 44,
    destination: 'UnderProcess Complains',
    image:'assets/dollar.jpeg',
  ),
  Slide(
    // id: 1,
    amount: 137,
    destination: 'Rejected Complains',
    image:'assets/dimond.jpeg',
  ),
  Slide(
    // id: 1,
    amount: 218,
    destination: 'Escalated',
    image:'assets/profile.jpeg',
  ),


];
