// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/constitution_model.dart';

class ConstitutionCard extends StatelessWidget {
  final Constitution constitution;
  const ConstitutionCard(this.constitution, {super.key});

  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent[80],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            SizedBox(
              height: 85,
              width: double.infinity,
              child: SvgPicture.asset("assets/images/ug.svg"),
            ),
            const Spacer(),
            Text(
              constitution.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer()
        ],
        ),
      ),
    );
  }
}
