import 'package:flutter/material.dart';

class TargetProgressBar extends StatelessWidget {
  const TargetProgressBar({super.key, required this.value, this.label = 'Target'});

  final double value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: value.clamp(0.0, 1.0),
          minHeight: 12,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }
}
