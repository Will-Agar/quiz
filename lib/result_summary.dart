import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['correct'] as bool
                        ? const Color.fromARGB(255, 47, 92, 49)
                        : const Color.fromARGB(255, 145, 44, 37),
                  ),
                  child: Center(
                    child: Text(
                      ((data['index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['chosenAnswer'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 88, 161, 222),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['correctAnswer'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 45, 129, 88),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
