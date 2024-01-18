import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class TaskModel {
  ObjectId id;
  String title;
  String description;
  String status;
  String dueDate;

  List assignedTo;
  String author;
  List comments;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.dueDate,
      required this.assignedTo,
      required this.author,
      required this.comments});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      dueDate: json['due_date'],
      assignedTo: json['assigned_to'],
      author: json['author'],
      comments: json['comments']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'status': status,
        'due_date': dueDate,
        'assigned_to': assignedTo,
        'author': author,
        'comments': comments
      };
}

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));
String taskModelToJson(TaskModel data) => json.encode(data.toJson());
