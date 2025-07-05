import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: const Center(
        child: Icon(
          Icons.search,
          size: 28,
        ),
      ),
    );
  }
}
