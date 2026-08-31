import 'package:flutter/material.dart';

class BuyCreditModal extends StatelessWidget {
  const BuyCreditModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Buy Credits'),
      content: const Text('Confirm purchase of EPR credits.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
