import 'package:flutter/material.dart';
import 'package:universityfinder/features/dashboard/bottom_screen/home_screen.dart';
import 'theme/theme.dart';
import 'features/splash/presentation/pages/splash_screen.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniGuide',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      // darkTheme: getDarkTheme(), // only if you define it
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => OnboardingScreen(), // remove const if constructor not const
        '/login': (_) => LoginPage(),
        '/register': (_) => SignupPage(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}
