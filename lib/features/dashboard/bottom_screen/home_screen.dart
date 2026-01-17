import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../widgets/university_card.dart';
import '../widgets/country_flag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('UniGuide', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search universities, courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: TextButton.icon(
                onPressed: () {
                  // Navigate to the AI Finder screen
                  Navigator.of(context).pushNamed('/ai_finder');
                },
                icon: const Icon(Icons.psychology_outlined, color: Colors.blue),
                label: const Text('Try out our AI to find your course →',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 20),

            // --- Popular Destinations Section ---
            const Text(
              'Popular Destinations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CountryFlag(flagEmoji: '🇬🇧', label: 'UK'),
                CountryFlag(flagEmoji: '🇺🇸', label: 'USA'),
                CountryFlag(flagEmoji: '🇦🇺', label: 'Australia'),
                CountryFlag(flagEmoji: '🇨🇦', label: 'Canada'),
              ],
            ),
            const SizedBox(height: 30),


            const Text(
              'In-Demand Courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Row(
              children: [
                Expanded(child: CourseCard(title: 'Computer Science')),
                SizedBox(width: 15),
                Expanded(child: CourseCard(title: 'Business')),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              'Top Universities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const UniversityCard(
              name: 'Stanford University',
              location: 'Stanford, CA, U.S.',
              rating: 4.8,
            ),
            const UniversityCard(
              name: 'Oxford University',
              location: 'Oxford, UK',
              rating: 4.9,
            ),
          ],
        ),
      ),
    );
  }
}