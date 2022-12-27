import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legal_companion/controller/constitution_controller.dart';
import 'package:legal_companion/services/service.dart';

import '../model/constitution_model.dart';



class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: const CupertinoSearchTextField(
            //           onSubmitted: (search) async {
            //             var response = await HttpService.getConstitutions(search);
            //             if (response.statusCode == 200) {
            //               List<dynamic> body = json.decode(response.body);

            //               List<Constitution> constitutions = body
            // .map(
            //   (dynamic item) => Constitution.fromJson(item),
            // )
            // .toList();
            //               var search = constitutionController.constitutionList[index];
            //               setState(() {
            //                  search =
            //                  print("object");
            //               });
            //             }
            //           },
                      autofocus: true,
                      itemColor: Colors.black,
                      itemSize: 20,
                      backgroundColor: Color.fromARGB(255, 185, 204, 218),
                      placeholderStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
  }
}
