import 'package:flutter/material.dart';

class ClaimFilingForm extends StatelessWidget {
  const ClaimFilingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(labelText: 'Claim ID'),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(labelText: 'Issue Description'),
          ),
        ],
      ),
    );
  }
}
