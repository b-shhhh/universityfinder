import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  final String flagEmoji;
  final String label;

  const CountryFlag({super.key, required this.flagEmoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Using Text/Emoji for flags, use an Image widget for actual flag assets
        Text(flagEmoji, style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}