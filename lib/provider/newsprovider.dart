import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Newsprovider extends ChangeNotifier{
  List Businessdata=[];
  List Sciencedata=[];
  List Sportsdata=[];
  bool loading=false;
  getdata({required String CategoryName}) async {
    loading = true;
    try{
    http.Response res= await http.get(Uri.parse(
       'https://newsapi.org/v2/top-headlines?category=$CategoryName&country=eg&apiKey=a0b05fa063584f49b5447acf4266155d'));
    if(res.statusCode==200){
      if(CategoryName=='business'){
        Businessdata = json.decode(res.body)['articles'];
      }else if(CategoryName=='sports'){
        Sportsdata= json.decode(res.body)['articles'];
      }else if(CategoryName=='science'){
        Sciencedata= json.decode(res.body)['articles'];
      }

    }else{
      print('${json.decode(res.body)['message']}');
    }

   loading=false;
  notifyListeners();
  }
  on SocketException{

  }

  catch(e){
      print(e.toString());
      notifyListeners();
    }
}
}
