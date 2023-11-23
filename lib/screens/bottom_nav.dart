import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:goto_hack_2023/constants/nav_items.dart';
import 'package:goto_hack_2023/screens/nav_item.dart';

class BottomNavbarWidget extends StatelessWidget {
  final Function? showHiddenMenus;
  final bool? draggable;

  const BottomNavbarWidget({super.key, this.showHiddenMenus, this.draggable});

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
