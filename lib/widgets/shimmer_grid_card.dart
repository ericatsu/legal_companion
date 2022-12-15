import 'package:flutter/material.dart';

class ShimmerGridCard extends StatelessWidget {
  const ShimmerGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle, color: Colors.white),
            )
          ),
          const Spacer(),
          Container(
            height: 30,
            width: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle, color: Colors.white),
          )
        ],
      ),
    );
  }
}