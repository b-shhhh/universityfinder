import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Courses'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search universities, courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // AI Suggestion Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Try our AI to find your course →'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 24),

            // Popular Destinations
            const Text('Popular Destinations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _flagIcon('USA'),
                _flagIcon('UK'),
                _flagIcon('Australia'),
              ],
            ),
            const SizedBox(height: 24),

            // In-Demand Courses
            const Text('In-Demand Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                _courseChip('Computer Science'),
                _courseChip('Business'),
              ],
            ),
            const SizedBox(height: 24),

            // Top Universities
            const Text('Top Universities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Column(
              children: [
                _universityCard('Stanford University', 'USA', 4.9),
                _universityCard('Oxford University', 'UK', 4.8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _flagIcon(String country) {
    return Column(
      children: [
        CircleAvatar(radius: 24, child: Text(country[0])), // Replace with flag image
        const SizedBox(height: 4),
        Text(country),
      ],
    );
  }

  Widget _courseChip(String course) {
    return Chip(
      label: Text(course),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget _universityCard(String name, String country, double rating) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.school),
        title: Text(name),
        subtitle: Text(country),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(rating.toString()),
          ],
        ),
      ),
    );
  }
}