import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:test0/ui/view/screens/widgets/task_assignment_dialog.dart';

class TaskAssignmentMenu extends StatelessWidget {
  const TaskAssignmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showPopover(
                  context: context,
                  width: 500,
                  height: 600,
                  direction: PopoverDirection.left,
                  bodyBuilder: (context) => TaskAssignmentDialog());
            },
            child: const Row(
              children: [
                Icon(Icons.edit),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Modifier",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              // update task
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Color(0xFFDA5252),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Supprimer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
