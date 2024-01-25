import 'Users.dart';
import 'dart:convert';

Myusers myusersFromJson(String str) => Myusers.fromJson(json.decode(str));
String myusersToJson(Myusers data) => json.encode(data.toJson());
class Myusers {
  Myusers({
      this.users, 
      this.total, 
      this.skip, 
      this.limit,});

  Myusers.fromJson(dynamic json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Users>? users;
  num? total;
  num? skip;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}