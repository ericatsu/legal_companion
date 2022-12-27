// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCard extends StatelessWidget {
  final String desc;
  final String name;
  final VoidCallback action;

  const ListCard({super.key, 
    required this.desc,
    required this.name,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.09,
      width: width * 0.07,
      child: InkWell(
        onTap: action,
        child: Card(
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      height: 18,
                      width: MediaQuery.of(context).size.width - 48,
                      child: Text(desc,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),),
                    ),
                    const SizedBox(height: 3,),
                    Expanded(
                      child: Text(name,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}