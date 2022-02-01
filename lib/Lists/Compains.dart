import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Slideemployee {
  //var id;
  var amount;
  var name1;
  var name2;
  var amount2;

  Slideemployee({
    //@required this.id,

    @required this.amount,
    @required this.name1,
    @required this.name2,
    @required this.amount2,


  });
}

List<Slideemployee> EmployeeslideList = [
  Slideemployee(
    //   id: 1,
    amount: '10',
    name1: 'Employes Name',
    name2:'Overall Employees 218',
    amount2:'+10%',

  ),
  Slideemployee(
    //   id: 1,
    amount: '\$1,42,300',
    name1: 'Earning',
    name2:'Previous Month \$1,15,852',
    amount2: '+12.5%',

  ),
  Slideemployee(
    //   id: 1,
    amount: '\$8,500',
    name1: 'Expenses',
    name2:'Previous Month \$7,500',
    amount2: '-2.8%',

  ),
  Slideemployee(
    //   id: 1,
    amount: '\$1,12,000',
    name1: 'Profit',
    name2:'Overall Employees 218',
    amount2: '-75%',

  ),


];