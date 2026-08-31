import 'package:flutter/material.dart';

class CreditMarketplaceScreen extends StatelessWidget {
  const CreditMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EPR Credit Marketplace'),
      ),
      body: const Center(
        child: Text('Marketplace Screen'),
      ),
    );
  }
}
