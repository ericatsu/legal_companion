// ignore_for_file: prefer_const_constructors

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Onboard3 extends StatelessWidget {
  const Onboard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/images/legal.svg",
                height: size.height * 0.42,
              ),
              Text(
                onboard3Title,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DelayedDisplay(
                fadingDuration: Duration(seconds: 1),
                child: Text(onboard3Desc,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
