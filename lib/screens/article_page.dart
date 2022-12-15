// ignore_for_file: must_be_immutable, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/constitution_controller.dart';
import '../model/constitution_model.dart';

class ArticlePage extends StatefulWidget {
  
  final Chapter chapter;
  ArticlePage({ required this.chapter});
  

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  final ConstitutionController constitutionController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C5D),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
          height: height * 0.12,
          color: const Color(0xFF0B3C5D),
        ),
        Column(
            children: [
              SizedBox(
                height: height * 0.10,
                child: Center(
                  child: Text(
                    widget.chapter.description,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: Obx(() {
                 return constitutionController.isLoading.value
                    ? Center(child: CircularProgressIndicator(color: Color(0xFF0B3C5D),))
                    : ListView.builder(
                      itemCount: constitutionController.sectionList.length,
                      itemBuilder: (context, index) {
                        Section section = constitutionController.sectionList[index];
                        return SizedBox(
                          height: height * 0.23,
                          child: Card(
                            child: Row(
                              children: [
                                  Column(
                                    children: [
                                      Container(
                                        color: Colors.grey[200],
                                        width: MediaQuery.of(context).size.width - 8,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            section.title,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.009,),
                                      Expanded(
                                        child: SizedBox(
                                          width: width * 0.925,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text(
                                              section.content,
                                              style: TextStyle(
                                                  fontSize: 17, color: Colors.grey[800]
                                                  ),
                                             ),
                                          ),
                                          ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        );
                      });
                }
                ),
                ),
            ],
          ),
        ]
        ),
      );
  }
}