import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'core/constants/hive_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Hive
  await Hive.initFlutter();

  // ✅ Open the box BEFORE running the app
  await Hive.openBox(HiveBoxes.userBox);

  runApp(const MyApp());
}
