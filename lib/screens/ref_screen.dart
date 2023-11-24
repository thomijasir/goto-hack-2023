import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:goto_hack_2023/screens/home_screen_one.dart';
import 'package:sizer/sizer.dart';

class RefScreen extends StatefulWidget {
  const RefScreen({super.key});

  @override
  State<RefScreen> createState() => _RefScreenState();
}

class _RefScreenState extends State<RefScreen> {
  double currentSliderSendingMoney = 0;
  double currentSliderPayBills = 0;
  double currentSliderPayQr = 0;
  double currentSliderSaving = 0;

  String getUI() {
    if (currentSliderSendingMoney >= 70) {
      return "SEND_MONEY";
    }

    if (currentSliderPayBills >= 70) {
      return "BILLS";
    }

    if (currentSliderPayQr >= 70) {
      return "QRIS";
    }

    return "SAVING";
  }

  @override
  void initState() {
    super.initState();
    currentSliderSendingMoney = 10;
    currentSliderPayBills = 20;
    currentSliderPayQr = 30;
    currentSliderSaving = 40;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlohaFullScreenSpinner(
        builder: (context) => Column(
          children: [
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 6.h, left: 6.w, right: 6.w),
                        child: const Text(
                          'Your preferences',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 2.h),
                        margin: EdgeInsets.only(left: 6.w, right: 6.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: Column(children: [
                          const Text(
                            'Sending Money',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Slider(
                            value: currentSliderSendingMoney,
                            max: 100,
                            divisions: 5,
                            label: currentSliderSendingMoney.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                currentSliderSendingMoney = value;
                              });
                            },
                          ),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 2.h),
                        margin: EdgeInsets.only(left: 6.w, right: 6.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: Column(children: [
                          const Text(
                            'Paying bills',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Slider(
                            value: currentSliderPayBills,
                            max: 100,
                            divisions: 5,
                            label: currentSliderPayBills.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                currentSliderPayBills = value;
                              });
                            },
                          ),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 2.h),
                        margin: EdgeInsets.only(left: 6.w, right: 6.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: Column(children: [
                          const Text(
                            'Pay by QRIS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Slider(
                            value: currentSliderPayQr,
                            max: 100,
                            divisions: 5,
                            label: currentSliderPayQr.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                currentSliderPayQr = value;
                              });
                            },
                          ),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 2.h),
                        margin: EdgeInsets.only(left: 6.w, right: 6.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: Column(children: [
                          const Text(
                            'Saving',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Slider(
                            value: currentSliderSaving,
                            max: 100,
                            divisions: 5,
                            label: currentSliderSaving.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                currentSliderSaving = value;
                              });
                            },
                          ),
                        ])),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlohaPrimaryButton.positive(
                      key: UniqueKey(),
                      const Text('Save and view my home screen'),
                      onTap: () {
                        final progress = AlohaFullScreenSpinner.of(context);
                        progress.show();
                        Future.delayed(const Duration(seconds: 2), () {
                          progress.dismiss();
                          var result = getUI();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreenOne(
                                  docState: result,
                                ),
                              ));
                        });
                      },
                    ),
                  ],
                ))
          ],
        )
            .animate(delay: const Duration(milliseconds: 500))
            .shimmer(duration: const Duration(seconds: 1)),
      ),
    );
  }
}
