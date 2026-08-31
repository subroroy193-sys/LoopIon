import 'package:flutter/material.dart';

class BpanScannerScreen extends StatelessWidget {
  const BpanScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BPAN Scanner'),
      ),
      body: const Center(
        child: Text('Scanner Screen'),
      ),
    );
  }
}
