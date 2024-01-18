import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final k;
  final value;

  const StatsCard({super.key, required this.k, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF191D22),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Center(
          child: Column(children: [
            Text(
              value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Color(0xFF8F8F8F),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              k,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF8F8F8F),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
