import 'package:flutter/material.dart';

class SalesCsvUploader extends StatelessWidget {
  const SalesCsvUploader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.upload_file),
          SizedBox(width: 12),
          Text('Upload CSV Sales File'),
        ],
      ),
    );
  }
}
