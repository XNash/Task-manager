import 'package:flutter/material.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/ui/view/screens/widgets/task_main_menu_icon.dart';

class TicketCard extends StatelessWidget {
  final TaskModel task;

  const TicketCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.task),
          title: Text(task.title),
          subtitle: Text("Deadline: ${task.dueDate}"),
          trailing: TaskMainMenuIcon(
            task: task,
          )),
    );
  }
}
