import 'package:flutter/material.dart';

class MessagesAlert extends StatelessWidget {
  const MessagesAlert({super.key});

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
          Icons.notifications,
          size: 20,
        ),
      ),
    );
  }
}
