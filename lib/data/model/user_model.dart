import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class UserModel {
  ObjectId id;
  String firstname;
  String lastname;

  String phone;

  String email;

  String passwd;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.email,
      required this.passwd});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      email: json['email'],
      passwd: json['passwd']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'passwd': passwd
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
