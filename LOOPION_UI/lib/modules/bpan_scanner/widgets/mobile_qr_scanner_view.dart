import 'package:flutter/material.dart';

class MobileQrScannerView extends StatelessWidget {
  const MobileQrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Center(
        child: Icon(Icons.qr_code_scanner, size: 80),
      ),
    );
  }
}
