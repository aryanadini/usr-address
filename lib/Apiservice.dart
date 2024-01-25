import 'dart:convert';

import 'package:mygetxusers/usersapi/Myusers.dart';
import 'package:mygetxusers/usersapi/Users.dart';
import 'package:http/http.dart' as http;


class ApiService{
  Future<List<Users>?>fetchdata()async{
    var webdata=await http.get(Uri.parse("https://dummyjson.com/users"));
    var webdata_in_JSOnformat=jsonDecode(webdata.body);
    var FirstLevelData=Myusers.fromJson(webdata_in_JSOnformat);
    var list=FirstLevelData.users;
    return list;


  }
}