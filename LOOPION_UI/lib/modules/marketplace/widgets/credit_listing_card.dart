import 'package:flutter/material.dart';

class CreditListingCard extends StatelessWidget {
  const CreditListingCard({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text('₹${price.toStringAsFixed(2)}'),
      ),
    );
  }
}
