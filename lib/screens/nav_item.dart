import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goto_hack_2023/constants/nav_items.dart';

class NavigationItem extends StatefulWidget {
  final NavItem navItem;
  final Function? showHiddenMenus;
  final bool? draggable;

  const NavigationItem({
    super.key,
    required this.navItem,
    this.showHiddenMenus,
    this.draggable,
  });

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        widget.showHiddenMenus!();
      },
      child: widget.draggable != null && widget.draggable == true
          ? Draggable(
              data: widget.navItem,
              feedback: _getNavItem(),
              child: _getNavItem(),
            )
          : _getNavItem(),
    );
  }

  Widget _getNavItem() {
    return DragTarget<NavItem>(
      builder: (BuildContext context, candidateData, rejectedData) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: AlohaBoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [-0.6, 1],
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(30, 49, 49, 49),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(9999)),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: AlohaBoxDecoration(
                          border: Border.all(
                              color: AlohaTheme.of(context)
                                  .colors
                                  .borderMutePrimary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9999)),
                      child: Center(
                        child: SvgPicture.asset(
                          widget.navItem.assetName,
                          fit: BoxFit.contain,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5.0),
            Text(widget.navItem.text,
                style: AlohaTheme.of(context)
                    .textTheme
                    .captionModerateBookDefault),
          ],
        );
      },
      onAcceptWithDetails: (details) {
        print(details.data);
      },
    );
  }
}
