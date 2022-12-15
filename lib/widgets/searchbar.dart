import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/constitution_model.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CupertinoSearchTextField(
                      onChanged: ((value) {
                        setState(() {
                          search = value;
                        });
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
                  );
  }
}
