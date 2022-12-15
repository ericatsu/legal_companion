// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_companion/screens/article_page.dart';

import '../controller/constitution_controller.dart';
import '../model/constitution_model.dart';
import '../widgets/listcard.dart';

class ChapterPage extends StatelessWidget {
  //  final Constitution constitutionId;

  ChapterPage({super.key});

  final ConstitutionController constitutionController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.25,
            width: width,
            color: Color(0xFF0B3C5D),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.20,
                child: Center(
                  child: Text(
                    "Chapters",
                    style: GoogleFonts.firaSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Flexible(
                child: Obx(() {
                  return constitutionController.isLoading.isTrue
                      ? Center(
                          child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ))
                      : ListView.builder(
                          itemCount: constitutionController.chapterList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Chapter chapter =
                                constitutionController.chapterList[index];
                            return ListCard(
                              action: () async {
                                await constitutionController
                                    .getSections(chapter.constitution, chapter.id)
                                    .then((response) {
                                  Get.to(() => ArticlePage(chapter: chapter));
                                });
                              },
                              desc: chapter.title,
                              name: chapter.description,
                            );
                          },
                          padding: EdgeInsets.all(10),
                        );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
