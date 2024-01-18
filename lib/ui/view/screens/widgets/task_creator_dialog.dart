import 'package:flutter/material.dart';

class TaskCreatorDialog extends StatelessWidget {
  final String status;

  TaskCreatorDialog({super.key, required this.status});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Nouvelle tâche",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: "Titre de la tâche",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: "Description", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: dueDateController,
                decoration: const InputDecoration(
                    labelText: "Délai (ex: 16/01/2024)",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: commentController,
                maxLines: 4,
                decoration: const InputDecoration(
                    labelText: "Commentaires", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                color: Color(0xFF28A745),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
                  child: Text(
                    "Ajouter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
