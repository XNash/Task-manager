import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:test0/data/model/task_model.dart';
import 'package:test0/ui/view/screens/widgets/task_main_menu.dart';

class TaskMainMenuIcon extends StatelessWidget {
  TaskModel task;

  TaskMainMenuIcon({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showPopover(
            context: context,
            bodyBuilder: (context) => TaskMainMenu(
                  task: task,
                ),
            direction: PopoverDirection.bottom,
            height: 100,
            width: 200),
        child: const Icon(Icons.more_vert));
  }
}
