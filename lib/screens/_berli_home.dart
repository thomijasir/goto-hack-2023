import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:goto_hack_2023/constants/nav_items.dart';
import 'package:goto_hack_2023/screens/content_body.dart';
import 'package:goto_hack_2023/screens/nav_item.dart';

class BerliHomeScreen extends StatefulWidget {
  const BerliHomeScreen({super.key});

  @override
  State<BerliHomeScreen> createState() => BerliHomeScreenState();
}

class BerliHomeScreenState extends State<BerliHomeScreen> {
  List<String> navIds = [];
  bool draggingExists = false;

  void toggleDragging(bool isDragging) {
    setState(() {
      draggingExists = isDragging;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      backgroundColor: AlohaColorTokens.gopayThemeLight().fillBackgroundPrimary,
      body: const ContentBody(),
      bottomNavigationBar: BottomNavbar(
        toggleDragging: toggleDragging,
        isDragging: draggingExists,
      ),
    );
  }
}

class DraggableNavItem extends StatelessWidget {
  final NavItem navItem;
  final Function toggleDragging;
  final bool isDragging;

  const DraggableNavItem({
    super.key,
    required this.navItem,
    required this.toggleDragging,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: NavigationItem(
        navItem: navItem,
      ),
      childWhenDragging: const SizedBox(
        width: 50.0,
        height: 50.0,
      ),
      child: NavigationItem(
        navItem: navItem,
      ),
      onDragStarted: () {
        toggleDragging(true);
      },
      onDragCompleted: () {
        toggleDragging(false);
      },
      onDragEnd: (details) {
        toggleDragging(false);
      },
      onDraggableCanceled: (velocity, offset) {
        toggleDragging(false);
      },
    );
  }
}

class BottomNavbar extends StatelessWidget {
  final Function toggleDragging;
  final bool isDragging;

  const BottomNavbar({
    super.key,
    required this.toggleDragging,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: AlohaBoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            border: Border.all(
                color: AlohaTheme.of(context).colors.borderStaticWhite),
            boxShadow: [
              AlohaTheme.of(context).shadow.shadowInnerHigh.toBoxShadow()
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var entry in navConstants.entries)
              DraggableNavItem(
                navItem: entry.value,
                toggleDragging: toggleDragging,
                isDragging: isDragging,
              ),
          ],
        ),
      ),
    );
  }
}
