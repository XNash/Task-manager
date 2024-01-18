import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/data/temp/temp.dart';
import 'package:test0/ui/view/screens/widgets/assignment_card.dart';
import 'package:test0/ui/view/screens/widgets/comment_card.dart';
import 'package:test0/ui/view/screens/widgets/comment_creator_dialog.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.task});

  final TaskModel task;

  @override
  _DetailsPageState createState() => _DetailsPageState(task);
}

class _DetailsPageState extends State<DetailsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final commentController = TextEditingController();
  TaskModel? task;

  _DetailsPageState(task) {
    this.task = task;
  }

  refresh(String status) {
    _updateTask(status);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    titleController.text = task!.title;
    descriptionController.text = task!.description;
  }

  Future<void> _updateTask(String status) async {
    final st = status;
    final title = titleController.text;
    final description = descriptionController.text;
    var data = TaskModel(
        id: task!.id,
        title: title,
        description: description,
        status: st,
        dueDate: task!.dueDate,
        assignedTo: task!.assignedTo,
        author: task!.author,
        comments: task!.comments);
    await MongoDatabase.updateTask(data);
    print("data: ${data.status}");

    setState(() {
      task = data;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "La tâche ${task!.title} a été mise à jour",
      style: const TextStyle(fontWeight: FontWeight.bold),
    )));
  }

  String _setPageStatus() {
    String stat = '';
    switch (task!.status) {
      case 'todo':
        stat = 'en attente';
        break;
      case 'doing':
        stat = 'en cours';
        break;
      case 'done':
        stat = 'terminée';
        break;
    }
    return stat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262C34),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${task!.title} (${_setPageStatus()})",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
            IconButton(
                onPressed: () => _updateTask(Temp.currentTask!.status),
                icon: const Icon(Icons.refresh))
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, ctr) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Card(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                            3 -
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              const Text(
                                                "Titre de la tâche",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                decoration: const InputDecoration(
                                                    labelText: "Titre",
                                                    border:
                                                        OutlineInputBorder()),
                                                controller: titleController,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _updateTask(task!.status);
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF28A745),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  elevation: 1,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                            3 -
                                        MediaQuery.of(context).size.height / 55,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                const Text(
                                                  "Attribué à",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                SizedBox(
                                                  height: 175,
                                                  child: ListView.builder(
                                                    itemCount:
                                                        task!.assignedTo.length,
                                                    itemBuilder: (context, i) =>
                                                        AssignmentCard(
                                                            user: task!
                                                                .assignedTo[i]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      const Color(0xFF007BFF),
                                                ),
                                                height: 50,
                                                width: 50,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              elevation: 1,
                              child: SizedBox(
                                height: (MediaQuery.of(context).size.height -
                                    MediaQuery.of(context).size.height / 3),
                                width: (MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).size.width / 2),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Détails de la tâche",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextField(
                                              decoration: const InputDecoration(
                                                  labelText: "Description",
                                                  border: OutlineInputBorder()),
                                              maxLines: 8,
                                              controller: descriptionController,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _updateTask(task!.status);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF28A745),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFC107)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Radio(
                                                            value: "todo",
                                                            onChanged: (value) {
                                                              _updateTask(
                                                                  'todo');
                                                            },
                                                            groupValue:
                                                                "status_selection",
                                                          ),
                                                          const Text(
                                                            "en attente",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFF007BFF)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Radio(
                                                            value: "doing",
                                                            onChanged: (value) {
                                                              _updateTask(
                                                                  'doing');
                                                            },
                                                            groupValue:
                                                                "status_selection",
                                                          ),
                                                          const Text(
                                                            "en cours",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFF28A745)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Radio(
                                                            value: "done",
                                                            onChanged: (value) {
                                                              _updateTask(
                                                                  'done');
                                                            },
                                                            groupValue:
                                                                "status_selection",
                                                          ),
                                                          const Text(
                                                            "Terminée",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFF191D22),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, left: 12, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Auteur: ${task?.author}\n${task?.description}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                color: Color(0xFF191D22),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Commentaires",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 5,
                        child: ListView.builder(
                          itemCount: task?.comments.length,
                          itemBuilder: (context, i) => CommentCard(
                            comment: task!.comments[i],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommentCreatorDialog(
                        (status) => refresh(task!.status))));
          },
        ),
      ),
    );
  }
}
