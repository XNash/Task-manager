import 'package:flutter/material.dart';

import '../widgets/stats_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(children: [
              const Text(
                "Tâches",
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
              const Row(
                children: [
                  StatsCard(k: "Tâches en cours", value: 120),
                  StatsCard(k: "Tâches terminées", value: 96),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right_alt_sharp),
                  label: const Text("Voir les détails"))
            ]),
          ),
          Column(children: [
            const Text(
              "Utilisateur",
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
            const Row(
              children: [
                StatsCard(k: "Tâches en cours", value: 120),
                StatsCard(k: "Tâches terminées", value: 96),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right_alt_sharp),
                label: const Text("Voir les détails"))
          ]),
          Column(children: [
            const Text(
              "Tâches",
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
            const Row(
              children: [
                StatsCard(k: "Tâches en cours", value: 120),
                StatsCard(k: "Tâches terminées", value: 96),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right_alt_sharp),
                label: const Text("Voir les détails"))
          ])
        ],
      ),
    );
  }
}
