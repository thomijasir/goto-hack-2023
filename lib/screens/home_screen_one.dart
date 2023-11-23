import 'package:animations/animations.dart';
import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goto_hack_2023/constant.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> getRefIcons = mapPreferences[widget.docState] ?? [];

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Stack(
          children: [
            Column(children: [
              SizedBox(
                height: 6.h,
              ),
              Expanded(
                flex: 6,
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
                        Image.asset(
                          cardEntertainmentPng,
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
                                      print(widget.docState);
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
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              width: 24.w,
                              child: Image.asset(buttonSearchAsset));
                        },
                      ),
                    ],
                  )),
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
        ));
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
