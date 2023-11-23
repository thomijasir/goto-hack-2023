import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:goto_hack_2023/constants/nav_items.dart';
import 'package:goto_hack_2023/screens/nav_item.dart';

class HomeScreenMantap extends StatefulWidget {
  const HomeScreenMantap({super.key});

  @override
  State<HomeScreenMantap> createState() => _HomeScreenMantapState();
}

class _HomeScreenMantapState extends State<HomeScreenMantap> {
  void showModal() {
    _showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(),
      bottomNavigationBar: BottomNavbar(
        showHiddenMenus: showModal,
        draggable: false,
      ),
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: AlohaBoxDecoration(
            color: AlohaTheme.of(context).colors.fillBackgroundQuaternary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(38.0),
              topRight: Radius.circular(38.0),
            ),
          ),
          height: 600.0,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(38),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8.0, // Adjust the gap between columns
                      mainAxisSpacing: 8.0, // Adjust the gap between rows
                    ),
                    itemCount: navConstants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NavigationItem(
                          draggable: true,
                          navItem: navConstants.entries.toList()[index].value);
                    },
                  ),
                ),
              ),
              const BottomNavbar(
                draggable: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavbar extends StatelessWidget {
  final Function? showHiddenMenus;
  final bool? draggable;

  const BottomNavbar(
      {super.key, this.showHiddenMenus, required this.draggable});

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
            for (var entry in navConstants.entries.take(4))
              NavigationItem(
                navItem: entry.value,
                showHiddenMenus: showHiddenMenus,
                draggable: draggable,
              ),
          ],
        ),
      ),
    );
  }
}
