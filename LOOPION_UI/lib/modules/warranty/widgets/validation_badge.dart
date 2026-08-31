import 'package:flutter/material.dart';

class ValidationBadge extends StatelessWidget {
  const ValidationBadge({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final color = status.toLowerCase() == 'approved' ? Colors.green : Colors.orange;
    return Chip(
      label: Text(status),
      backgroundColor: color.withValues(alpha: 0.15),
      labelStyle: TextStyle(color: color),
    );
  }
}
