import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 24.0),
            ),
            // Add more content as needed
            // ...
          ],
        ),
      ),
    );
  }
}
