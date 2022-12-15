import 'package:flutter/material.dart';

class ShimmerForArticle extends StatelessWidget {
  const ShimmerForArticle({super.key});


  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 63,
        child: Card(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                    width: MediaQuery.of(context).size.width - 48,
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.white),
                      )
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.white),
                )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
