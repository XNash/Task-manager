import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/temp/temp.dart';

import '../../../../data/model/task_model.dart';

class TaskCommentCardMenu extends StatelessWidget {
  TaskCommentCardMenu({super.key});
  final commentCtrl = TextEditingController();

  Future<void> deleteSelectedComment() async {
    int i = 0;
    for (var comment in Temp.currentTask!.comments) {
      if (comment.toString() == Temp.selectedComment.toString()) {
        Temp.currentTask!.comments.removeAt(i);
        print(Temp.currentTask!.comments);
      }
      i++;
    }
  }

  Future<void> editSelectedComment() async {
    deleteSelectedComment();
    String content = commentCtrl.text;
    List comments = Temp.currentTask!.comments;
    var dateInit = DateTime.now().toLocal();

    String date =
        "${dateInit.day.toString().padLeft(2, '0')}/${dateInit.month.toString().padLeft(2, '0')}/${dateInit.year}";
    Map<String, dynamic> newComment = {
      "author": Temp.currentUser!.firstname,
      "content": content,
      "date": date,
    };
    comments.add(newComment);
    TaskModel task = TaskModel(
        id: Temp.currentTask!.id,
        title: Temp.currentTask!.title,
        description: Temp.currentTask!.description,
        status: Temp.currentTask!.status,
        dueDate: Temp.currentTask!.dueDate,
        assignedTo: Temp.currentTask!.assignedTo,
        author: Temp.currentTask!.author,
        comments: comments);
    await MongoDatabase.updateTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      MediaQuery.of(context).size.width / 3,
                      MediaQuery.of(context).size.height / 3,
                      MediaQuery.of(context).size.width / 3,
                      MediaQuery.of(context).size.height / 3),
                  items: [
                    PopupMenuItem(
                        child: SizedBox(
                      height: 150,
                      width: 400,
                      child: Column(
                        children: [
                          TextField(
                            controller: commentCtrl,
                            decoration:
                                const InputDecoration(labelText: "Votre commentaire"),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            child: const SizedBox(
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Text(
                                  "Envoyer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF007BFF)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ]);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Modifier",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              deleteSelectedComment();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Le commentaire a été supprimé avec succès. Veuillez rafraichir la page")));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Color(0xFFDC3545),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Supprimer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
