import 'package:flutter/material.dart';

class QrPrintPreview extends StatelessWidget {
  const QrPrintPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(Icons.qr_code_2, size: 80),
      ),
    );
  }
}
