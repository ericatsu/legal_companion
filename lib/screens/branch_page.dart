// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_companion/screens/chapter_page.dart';

import '../controller/constitution_controller.dart';
import '../model/constitution_model.dart';
import '../widgets/listcard.dart';

class BranchPage extends StatelessWidget {
  final Constitution constitutionId;

  BranchPage({super.key, required this.constitutionId});

  final ConstitutionController constitutionController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200]!,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C5D),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 20,
            )),
      ),
      body: Stack(children: [
        Container(
          height: height * 0.35,
          color: const Color(0xFF0B3C5D),
        ),
        SafeArea(
          child: constitutionController.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(
                  color: Color(0xFF0B3C5D),
                ))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Container(
                      //     height: 35,
                      //     width: 85,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       color: const Color.fromARGB(255, 248, 224, 88),
                      //       shape: BoxShape.rectangle,
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         IconButton(
                      //           onPressed: () {},
                      //           icon: const Icon(Icons.share_rounded, color: Colors.white, size: 20,)),
                      //         const Text("Share",
                      //         style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 120,
                        width: 100,
                        child: SvgPicture.asset("assets/images/ug.svg"),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        textAlign: TextAlign.center,
                        constitutionId.title,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Ink(
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              SizedBox(height: 25,),
                              ListCard(
                                desc:
                                    'Tap on this display the constitution preamble',
                                name: 'Preamble',
                                action: () {
                                  Get.defaultDialog(
                                    title: "ABOUT CONSTITUTION",
                                    content: Flexible(
                                      child: SingleChildScrollView(
                                        child: Text(constitutionId.preamble,
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18),
                                            )),
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    titleStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                    radius: 8.0,
                                  );
                                },
                              ),
                              ListCard(
                                desc:
                                    'Display the constitution chapters next page',
                                name: 'Chapters',
                                action: () async {
                                  await constitutionController
                                      .getChapters(constitutionId.id)
                                      .then((value) {
                                    Get.to(ChapterPage());
                                  });
                                },
                              ),
                              ListCard(
                                desc:
                                    'Tap to view added amendements of the constitution',
                                name: 'The Amendments',
                                action: () async {
                                  await constitutionController
                                      .getChapters(constitutionId.id)
                                      .then((value) {
                                    Get.to(ChapterPage());
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ]),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF0B3C5D),
            child: const Icon(Icons.share_rounded, size: 30,),
          ),
        ),
      ),
    );
  }
}
