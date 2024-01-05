import 'package:flutter/material.dart';

class ReactionComponents extends StatelessWidget {
  const ReactionComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: const Center(
            child: Column(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
                Text(
                  'MASH ALLAH (12k)',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 45,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/like.png',
                  color: Colors.grey,
                ),
                const Text(
                  'LIKE (12k)',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 45,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/share.png',
                  color: Colors.grey,
                ),
                const Text(
                  'SHARE',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 45,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: const Center(
            child: Column(
              children: [
                Icon(
                  Icons.flag_outlined,
                  color: Colors.grey,
                ),
                Text(
                  'REPORT',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
