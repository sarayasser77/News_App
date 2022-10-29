import 'package:flutter/material.dart';
import 'package:news/view/business/business.dart';
import 'package:news/view/science/science.dart';
import 'package:news/view/sports/sports.dart';
class Buttonprovider extends ChangeNotifier{
  int index=0;
  List <BottomNavigationBarItem>  items=[
  BottomNavigationBarItem(icon: Icon(Icons.business),label:'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_rounded),label: 'Sports'),

  ];
  List screens=[
    Business(),
    Science(),
    Sports(),
  ];

  changeindex({required int index}){
this.index=index;
    notifyListeners();
  }
}