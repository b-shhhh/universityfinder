import 'package:flutter/material.dart';

/// Shows a snackbar with optional color and duration
void showMySnackBar({
  required BuildContext context,
  required String message,
  Color color = Colors.blue,
  Duration duration = const Duration(seconds: 2),
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  // Remove any current snackbar and show new one
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
