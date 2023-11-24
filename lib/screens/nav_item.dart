import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(),
                body: Center(child: Text('CONTENT FOR ${widget.navItem.text}')),
              ),
            ));
      },
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
    ).animate();
  }

  Widget _getNavItem() {
    return DragTarget<NavItem>(
      builder: (BuildContext context, candidateData, rejectedData) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SvgPicture.asset(
                widget.navItem.assetName,
                fit: BoxFit.contain,
                height: 52,
              ),
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
        // TODO: Switch item logic here
      },
    );
  }
}
