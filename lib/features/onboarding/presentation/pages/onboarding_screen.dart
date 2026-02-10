import 'package:flutter/material.dart';

// --- Data Model for Onboarding Pages (Same as before) ---
class OnboardContent {
  final String title;
  final String description;
  final IconData icon;

  OnboardContent({required this.title, required this.description, required this.icon});
}

final List<OnboardContent> onboardData = [
  OnboardContent(
    title: "Find Your Perfect Course",
    description: "Use our AI-powered finder to narrow down thousands of courses globally based on your profile and preferences.",
    icon: Icons.search_rounded,
  ),
  OnboardContent(
    title: "Compare Top Universities",
    description: "Get detailed information, rankings, reviews, and application deadlines for the world's leading institutions.",
    icon: Icons.school_rounded,
  ),
  OnboardContent(
    title: "Simplify Your Application",
    description: "Manage all your university applications, track their status, and submit required documents in one place.",
    icon: Icons.assignment_turned_in_rounded,
  ),
];

// --- Onboarding Screen Widget ---
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0; // Track current page index

  @override
  void initState() {
    super.initState();
    // Add listener to update the page index state
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPageIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper method to build a single indicator dot
  Widget _buildPageIndicator(int index) {
    bool isActive = index == _currentPageIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0, // Expand the active dot
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPageIndex == onboardData.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          // 1. PageView for swipable screens
          PageView.builder(
            controller: _pageController,
            itemCount: onboardData.length,
            // We use the listener in initState instead of onPageChanged for cleaner index tracking
            itemBuilder: (context, index) {
              return OnboardPage(content: onboardData[index]);
            },
          ),

          // 2. Dots and Action Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  if (!isLastPage)
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: const Text("Skip", style: TextStyle(color: Colors.black54)),
                    ),

                  // Page Indicator Dots (Native Implementation)
                  Row(
                    children: List.generate(onboardData.length, (index) => _buildPageIndicator(index)),
                  ),

                  // Next/Get Started Button
                  isLastPage
                      ? ElevatedButton(
                    onPressed: () {
                      // Navigate to the Login Screen
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: const Text("Get Started"),
                  )
                      : ElevatedButton(
                    onPressed: () {
                      // Move to the next page
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Single Onboarding Page Layout (Same as before) ---
class OnboardPage extends StatelessWidget {
  final OnboardContent content;

  const OnboardPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Placeholder for the main image/vector
          Icon(
            content.icon,
            size: 150,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 50),

          // Title
          Text(
            content.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E), // Deep Blue
            ),
          ),
          const SizedBox(height: 15),

          // Description
          Text(
            content.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}