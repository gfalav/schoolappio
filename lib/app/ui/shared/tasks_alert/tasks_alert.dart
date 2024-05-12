import 'package:flutter/material.dart';

class TasksAlert extends StatelessWidget {
  const TasksAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: const Text(
        "20",
        style: TextStyle(
          fontSize: 8,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.chat,
          size: 20,
        ),
      ),
    );
  }
}
