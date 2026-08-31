import 'package:flutter/material.dart';

import '../../config/features_config.dart';

class DynamicDrawer extends StatelessWidget {
  const DynamicDrawer({
    super.key,
    required this.items,
    this.selectedRoute,
    this.onSelect,
  });

  final List<FeatureDefinition> items;
  final String? selectedRoute;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'LoopIon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Operations Suite',
                  style: TextStyle(
                    color: colorScheme.onPrimary.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ...items.map(
            (feature) => ListTile(
              leading: Icon(feature.icon),
              title: Text(feature.label),
              selected: selectedRoute == feature.route,
              selectedTileColor: colorScheme.primaryContainer,
              onTap: () => onSelect?.call(feature.route),
            ),
          ),
        ],
      ),
    );
  }
}
