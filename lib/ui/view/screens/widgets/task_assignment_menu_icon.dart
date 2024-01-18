import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:test0/ui/view/screens/widgets/task_assignment_menu.dart';

class TaskAssigmentMenuIcon extends StatelessWidget {
  const TaskAssigmentMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
            width: 150,
            height: 90,
            context: context,
            bodyBuilder: (context) => const TaskAssignmentMenu(),
            direction: PopoverDirection.bottom);
      },
      child: const Icon(Icons.more_vert),
    );
  }
}
