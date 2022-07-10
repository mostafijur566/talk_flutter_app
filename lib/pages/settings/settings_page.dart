import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AFdZucos_R6GKfq6SF1g56Dq02tMrJOk0Zx5jtWzfWMqaw=s96-c'),
          ),
        ),

        Text(
          'Mostafijur Rahman',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
