// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_companion/screens/constitution_page.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/constitution_controller.dart';
import '../model/constitution_model.dart';
import '../widgets/constitution_card.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/shimmer_grid_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConstitutionController constitutionController = Get.find();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C5D),
        elevation: 0.0,
      ),
      drawer: DrawerWidget(),
      body: Stack(children: [
        Container(
          height: height * 0.45,
          decoration: const BoxDecoration(
            color: Color(0xFF0B3C5D),
            // image: DecorationImage(
            //   image: ExactAssetImage('images/hpb.png'))
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Legal Companion',
                  style: GoogleFonts.firaSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
                // The Search bar
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: CupertinoSearchTextField(
                    onChanged: ((value) {
                      
                    }),
                    autofocus: true,
                    itemColor: Colors.black,
                    itemSize: 20,
                    backgroundColor: const Color.fromARGB(255, 185, 204, 218),
                    placeholderStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),
                Flexible(
                  child: Obx(() {
                    if (constitutionController.isLoading.value) {
                      return GridView.builder(
                        itemBuilder: (_, __) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              period: Duration(seconds: 2),
                              enabled: constitutionController.isLoading.value,
                              child: ShimmerGridCard());
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                      );
                    } else {
                      return GridView.builder(
                          itemCount:
                              constitutionController.constitutionList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            Constitution constitution =
                                constitutionController.constitutionList[index];
                            return InkWell(
                                onTap: (() {
                                  Get.to(
                                      BranchPage(constitutionId: constitution));
                                }),
                                child: ConstitutionCard(constitutionController
                                    .constitutionList[index]));
                          });
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
