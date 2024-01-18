import 'package:flutter/material.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/ui/view/screens/pages/details_page.dart';

import '../../../../data/temp/temp.dart';

class TaskMainMenu extends StatelessWidget {
  TaskModel task;

  TaskMainMenu({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Ajouter nouvelle tâche")
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.description),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Afficher les détails")
                  ],
                ),
              ),
            ),
            onTap: () {
              Temp.currentTask = task;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            task: task,
                          )));
            },
          ),
        ],
      ),
    );
  }
}
