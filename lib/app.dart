import 'package:flutter/material.dart';

import 'features/dashboard/presentation/bottom_screen_layout.dart';
import 'theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps for College',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      //home: const DashboardScreen(),
      home: const BottomscreenLayout(),
    );
  }
}
