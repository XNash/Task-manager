import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/ui/view/screens/widgets/task_card.dart';
import 'package:test0/ui/view/screens/widgets/task_creator_dialog.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Tâches à faire",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width / 5,
                        child: FutureBuilder(
                          future: MongoDatabase.getTodoList('todo'),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, i) {
                                    return TicketCard(
                                        task: TaskModel.fromJson(
                                            snapshot.data[i]));
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text("Aucune tâche à faire"),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                MediaQuery.of(context).size.width / 2 -
                                    MediaQuery.of(context).size.width / 15,
                                MediaQuery.of(context).size.height / 2 -
                                    MediaQuery.of(context).size.height / 4,
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height / 2),
                            items: [
                              PopupMenuItem(
                                child: TaskCreatorDialog(status: 'todo'),
                                onTap: () {},
                              )
                            ],
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xFF8F8F8F),
                            ),
                            Text(
                              "Ajouter une tâche",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Tâches en cours",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width / 5,
                        child: FutureBuilder(
                          future: MongoDatabase.getTodoList('doing'),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, i) {
                                    return TicketCard(
                                        task: TaskModel.fromJson(
                                            snapshot.data[i]));
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text("Aucune tâche en cours"),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                MediaQuery.of(context).size.width / 2 -
                                    MediaQuery.of(context).size.width / 15,
                                MediaQuery.of(context).size.height / 2 -
                                    MediaQuery.of(context).size.height / 4,
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height / 2),
                            items: [
                              PopupMenuItem(
                                child: TaskCreatorDialog(status: 'doing'),
                                onTap: () {},
                              )
                            ],
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xFF8F8F8F),
                            ),
                            Text(
                              "Ajouter une tâche",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Tâches validés",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width / 5,
                        child: FutureBuilder(
                          future: MongoDatabase.getTodoList('done'),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, i) {
                                    return TicketCard(
                                        task: TaskModel.fromJson(
                                            snapshot.data[i]));
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text("Aucune tâche terminée"),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                MediaQuery.of(context).size.width / 2 -
                                    MediaQuery.of(context).size.width / 15,
                                MediaQuery.of(context).size.height / 2 -
                                    MediaQuery.of(context).size.height / 4,
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height / 2),
                            items: [
                              PopupMenuItem(
                                child: TaskCreatorDialog(
                                  status: 'done',
                                ),
                                onTap: () {},
                              )
                            ],
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xFF8F8F8F),
                            ),
                            Text(
                              "Ajouter une tâche",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
