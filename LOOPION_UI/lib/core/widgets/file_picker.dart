import 'package:flutter/material.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }
}
