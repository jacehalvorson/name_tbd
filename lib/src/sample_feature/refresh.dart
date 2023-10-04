import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.chevron_left_rounded,
              // TODO use color scheme
              color: Colors.grey.shade700,
              size: 150.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.chevron_right_rounded,
              // TODO use color scheme
              color: Colors.grey.shade700,
              size: 150.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ),
      ),
    );
  }
}
