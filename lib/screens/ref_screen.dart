import 'package:flutter/material.dart';

class RefScreen extends StatefulWidget {
  const RefScreen({super.key});

  @override
  State<RefScreen> createState() => _RefScreenState();
}

class _RefScreenState extends State<RefScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Content Here')),
    );
  }
}
