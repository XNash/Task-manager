import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final user;

  const AssignmentCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          user,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
