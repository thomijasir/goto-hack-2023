import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Widget svgHomePlaceholder = SvgPicture.asset(
    'assets/home_screen.svg',
    semanticsLabel: 'Sample Home',
    fit: BoxFit.cover,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: 100.w, child: svgHomePlaceholder),
    );
  }
}
