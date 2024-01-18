import 'package:mongo_dart/mongo_dart.dart';
import 'package:test0/data/database/online/dbHelper/constants.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/data/model/user_model.dart';

class MongoDatabase {
  /// Methode pour gerer la connection avec la base de données

  static var _db, _tasks, _users;

  static connect() async {
    _db = Db(MONGO_CONN_URL);
    await _db.open();
    _tasks = _db.collection(TASKS_COLLECTION);
    _users = _db.collection(USERS_COLLECTION);
  }

  // Utilisateurs

  static Future<String> insertUser(UserModel data) async {
    try {
      var result = await _users.insertOne(data.toJson());
      if (result.isSuccess) {
        return 'Données insérés avec succès';
      } else {
        return "Erreur lors de l'insertion des données";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final users = await _users.find().toList();
    return users;
  }

  static Future<Map<String, dynamic>?> getUser(f1, v1, f2, v2) async {
    var user;
    if (f2 != null && v2 != null) {
      user = await _users.findOne(where.eq(f1, v1).eq(f2, v2));
    } else {
      user = await _users.findOne(where.eq(f1, v2));
    }
    return user;
  }

  // Tâches

  static Future<String> insertTask(TaskModel data) async {
    try {
      final result = await _tasks.insertOne(data.toJson());
      if (result.isSuccess) {
        return 'La tâche a été créé avec succès';
      } else {
        return 'Erreur lors de la création de la tâche';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getAllTasks() async {
    final tasks = await _tasks.find().toList();
    return tasks;
  }

  static Future<Map<String, dynamic>?> getTask(String f, v) async {
    final task = await _tasks.findOne(where.eq(f, v));
    return task;
  }

  static Future<List<Map<String, dynamic>>> getTodoList(String status) async {
    final todolist = await _tasks.find(where.eq('status', status)).toList();
    return todolist;
  }

  static Future<void> updateTask(TaskModel data) async {
    final result = await _tasks.findOne(where.eq('_id', data.id));
    if (result != null) {
      await _tasks.updateOne(
          where.eq('_id', data.id),
          ModifierBuilder()
              .set('title', data.title)
              .set('description', data.description)
              .set('status', data.status)
              .set('assigned_to', data.assignedTo)
              .set('author', data.author)
              .set('comments', data.comments));
    }
  }

  static Future<void> deleteTask(TaskModel data) async {
    final result = await _tasks.deleteOne(where.eq('_id', data.id));
  }
}
