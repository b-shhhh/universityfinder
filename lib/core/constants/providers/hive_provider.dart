import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../hive_boxes.dart';

final userBoxProvider = Provider<Box>((ref) {
  return Hive.box(HiveBoxes.userBox);
});
