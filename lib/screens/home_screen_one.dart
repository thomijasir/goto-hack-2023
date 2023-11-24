import 'package:animations/animations.dart';
import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goto_hack_2023/constant.dart';
import 'package:goto_hack_2023/constants/nav_items.dart';
import 'package:goto_hack_2023/screens/bottom_nav.dart';
import 'package:goto_hack_2023/screens/nav_item.dart';
import 'package:sizer/sizer.dart';

class HomeScreenOne extends StatefulWidget {
  final String docState;
  const HomeScreenOne({super.key, this.docState = "SAVING"});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  final Widget svgHomePlaceholder = SvgPicture.asset(
    'assets/home_screen.svg',
    semanticsLabel: 'Sample Home',
    fit: BoxFit.cover,
  );
  final ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;

  List<NavItem> mainDocs = [];

  _BottomSheetState? _bottomSheetState;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    setState(() {
      mainDocs = dockBaseOnPreference[widget.docState] ?? [];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showModal() {
    _showModal(_scaffoldKey.currentContext!);
  }

  void updateMainDocs(NavItem sourceDoc, NavItem targetDoc) {
    int souceDocIndex =
        mainDocs.indexWhere((item) => item.assetName == sourceDoc.assetName);
    int targetDocIndex =
        mainDocs.indexWhere((item) => item.assetName == targetDoc.assetName);

    if (souceDocIndex != -1) {
      setState(() {
        NavItem itemToMove = mainDocs.removeAt(souceDocIndex);
        mainDocs.insert(targetDocIndex, itemToMove);
      });

      // Update the state of the bottom sheet explicitly
      _bottomSheetState?.updateState(mainDocs);
    } else {
      print('Item with assetName not found.');
      setState(() {
        mainDocs[targetDocIndex] = sourceDoc;
      });

      print(mainDocs.map((e) => e.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> getRefIcons = mapPreferences[widget.docState] ?? [];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Column(children: [
            SizedBox(
              height: 6.h,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(card24Png),
                    ],
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          cardEntertainmentPng,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                            getRefIcons.length,
                            (int index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                            appBar: AppBar(),
                                            body: const Center(
                                                child: Text(
                                                    'PLACEHOLDER QUICK ACTION')),
                                          ),
                                        ));
                                  },
                                  child: SizedBox(
                                    width: 18.w,
                                    child: Image.asset(getRefIcons[index]),
                                  ),
                                )),
                      ],
                    ),
                  )),
                ],
              ),
            ).animate(delay: const Duration(milliseconds: 1000)).shimmer(),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Column(
                children: [
                  OpenContainer(
                    transitionType: _containerTransitionType,
                    transitionDuration: const Duration(milliseconds: 500),
                    openBuilder: (context, _) => const SearchInput(),
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.w)),
                    closedElevation: 2,
                    closedColor: Colors.white,
                    closedBuilder: (context, _) {
                      return SizedBox(
                          width: 24.w, child: Image.asset(buttonSearchAsset));
                    },
                  ),
                ],
              ),
            ),
          ]),
          Positioned(
            right: 0,
            top: 50.h,
            child: SizedBox(
              height: 18.h,
              child: Image.asset("assets/floating_rp.png"),
            ),
          ).animate(delay: const Duration(milliseconds: 1000)).shimmer(),
        ],
      ),
      bottomNavigationBar: BottomNavbarWidget(
        showHiddenMenus: showModal,
        draggable: false,
        navItems: mainDocs,
      ),
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _BottomSheetWidget(
          initialState: mainDocs,
          onWidgetCreated: (state) => _bottomSheetState = state,
          updateMainDocs: updateMainDocs,
        );
      },
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      searchFocusNode.requestFocus(); //auto focus on second text field.
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: List.generate(
                  mapSearch.length,
                  (index) => SizedBox(
                      width: 20.w, child: Image.asset(mapSearch[index]))),
            ),
          )
              .animate(delay: const Duration(milliseconds: 600))
              .shimmer(duration: const Duration(seconds: 1)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 9.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: TextField(
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(48))),
                ),
              ),
            ),
          )
              .animate(delay: const Duration(milliseconds: 300))
              .fadeIn()
              .shimmer(),
        ],
      )),
    );
  }
}

class _BottomSheetWidget extends StatefulWidget {
  final List<NavItem> initialState;
  final void Function(_BottomSheetState) onWidgetCreated;
  final Function(NavItem, NavItem) updateMainDocs;

  const _BottomSheetWidget({
    Key? key,
    required this.initialState,
    required this.onWidgetCreated,
    required this.updateMainDocs,
  }) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_BottomSheetWidget> {
  List<NavItem> _mainDocs = [];

  @override
  void initState() {
    super.initState();
    _mainDocs = widget.initialState;

    widget.onWidgetCreated(this);
  }

  void updateState(List<NavItem> newState) {
    setState(() {
      _mainDocs = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0, // Adjust the gap between columns
                  mainAxisSpacing: 8.0, // Adjust the gap between rows
                ),
                itemCount: docks.length,
                itemBuilder: (BuildContext context, int index) {
                  return NavigationItem(
                    draggable: true,
                    navItem: docks[index],
                    isMainDock: false,
                  );
                },
              ),
            ),
          ),
          BottomNavbarWidget(
            draggable: true,
            navItems: _mainDocs,
            updateMainDocs: widget.updateMainDocs,
          ),
        ],
      ),
    );
  }
}
