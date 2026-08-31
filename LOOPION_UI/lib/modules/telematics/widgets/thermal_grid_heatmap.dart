import 'package:flutter/material.dart';

class ThermalGridHeatmap extends StatelessWidget {
  const ThermalGridHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 16,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (_, index) {
        final color = Colors.primaries[index % Colors.primaries.length].withValues(alpha: 0.7);
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}
