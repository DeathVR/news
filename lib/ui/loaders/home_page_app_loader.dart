import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageAppBarLoader extends StatelessWidget {
  const HomePageAppBarLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Загрузка',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Color(0xff4149e8),
      ),
    );
  }
}
