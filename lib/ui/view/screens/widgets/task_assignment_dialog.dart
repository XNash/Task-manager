import 'package:flutter/material.dart';

import '../../../../data/temp/temp.dart';

class TaskAssignmentDialog extends StatelessWidget {
  late var task;
  final assignedUserController = TextEditingController();

  TaskAssignmentDialog({super.key}) {
    task = Temp.currentTask;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          child: Column(
            children: [
              const Text(
                "Sélectionner utilisateur",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: Temp.userCountAll,
                  itemBuilder: (context, i) => Container(
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(Temp.userListFull[i]['username']),
                        subtitle: Text(Temp.userListFull[i]['email']),
                        trailing: GestureDetector(
                          onTap: () {
                            // update task
                          },
                          child: const SizedBox(
                            height: 100,
                            width: 150,
                            child: Card(
                              color: Color(0xFF007BFF),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.save_as_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Selectionner",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
