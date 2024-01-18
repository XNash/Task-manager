import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/data/temp/temp.dart';

class CommentCreatorDialog extends StatelessWidget {
  final Function(String) addAndRefresh;
  final commentCtrl = TextEditingController();

  CommentCreatorDialog(this.addAndRefresh, {super.key});

  Future<void> createComment() async {
    final comment = commentCtrl.text;
    List comments = Temp.currentTask!.comments;
    print(comments);
    var dateInit = DateTime.now().toLocal();

    String date =
        "${dateInit.day.toString().padLeft(2, '0')}/${dateInit.month.toString().padLeft(2, '0')}/${dateInit.year}";
    Map<String, dynamic> newComment = {
      "author": Temp.currentUser!.firstname,
      "content": comment,
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
    return Scaffold(
      backgroundColor: const Color(0xFF262C34),
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 4,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 10, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Commenter le ticket de la tâche ${Temp.currentTask!.title}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Votre commentaire',
                          border: OutlineInputBorder()),
                      maxLines: 1,
                      controller: commentCtrl,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        createComment();
                        addAndRefresh(Temp.currentTask!.status);
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF007BFF),
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        width: 200,
                        child: const Center(
                          child: Text(
                            "Envoyer",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
