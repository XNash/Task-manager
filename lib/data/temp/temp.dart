import '../model/task_model.dart';
import '../model/user_model.dart';

class Temp {
  // Taches
  static TaskModel? currentTask;
  static UserModel? currentUser;
  static var selectedComment;

  // Utilisateurs
  static List userListFull = [];
  static var userCountAll;

  static reset() {
    currentTask = null;
    currentUser = null;
    userListFull = [];
    userCountAll = 0;
  }
}
