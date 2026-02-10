import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;

  const CourseCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
      ),
    );
  }
}