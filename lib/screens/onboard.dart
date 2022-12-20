// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_companion/screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import '../onBoardScreens/onboard1.dart';
import '../onBoardScreens/onboard2.dart';
import '../onBoardScreens/onboard3.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  // Pages
  PageController _controller = PageController();

  // On last page function
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
      children: [
        //Page View
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [Onboard1(), Onboard2(), Onboard3()],
        ),

        //Skip
        onLastPage ?
        Positioned(
          top: 25,
          right: 20,
          child: TextButton(
            onPressed: () {
              _controller.jumpToPage(2);
            },
            child: Text(" ",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: kMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
        ) : Positioned(
          top: 25,
          right: 20,
          child: TextButton(
            onPressed: () {
              _controller.jumpToPage(2);
            },
            child: Text("Skip",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: kMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
        ),


        // buttons
        onLastPage
            ? Positioned(
                bottom: 60,
                child: GestureDetector(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: kMainColor),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20)),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: kMainColor, shape: BoxShape.circle),
                      child: Text('Start'),
                    ),
                  ),
                ),
              )
            : Positioned(
                bottom: 60,
                child: OutlinedButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: kMainColor),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20)),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: kMainColor, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),

        // Indicator
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              activeDotColor: kMainColor,
              dotHeight: 4.0,
            ),
          ),
        ),
      ],
    ));
  }
}
