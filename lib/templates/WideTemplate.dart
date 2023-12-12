import 'package:flutter/material.dart';

class WideTemplate extends StatelessWidget {
  final Widget? head;
  final Widget? body;

  const WideTemplate({super.key, this.head, this.body});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: head == null ? 0 : 185,
              width: double.infinity,
              child: head,
            ),
            SizedBox(
              width: 850,
              child: body,
            ),
          ],
        ),
      ],
    );
  }
}
