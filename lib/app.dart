import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:universityfinder/features/auth/presentation/pages/register_screen.dart';

import 'features/auth/presentation/pages/login_screen.dart';
import 'features/dashboard/presentation/bottom_screen_layout.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps for College',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const BottomscreenLayout(),
      },
    );
  }
}
