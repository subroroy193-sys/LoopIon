import 'package:flutter/material.dart';

class BpanBatchForm extends StatelessWidget {
  const BpanBatchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(labelText: 'Batch Name'),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
