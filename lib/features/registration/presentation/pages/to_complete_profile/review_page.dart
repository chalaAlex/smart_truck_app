import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  final String name;
  const ReviewPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(
            name,
            style: TextStyle(
              fontSize: 30,
            ),
          ))
        ],
      ),
    );
  }
}