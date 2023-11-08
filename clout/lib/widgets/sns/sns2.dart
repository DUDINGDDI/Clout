import 'package:flutter/material.dart';

class Sns2 extends StatelessWidget {
  const Sns2({super.key, required this.selectedPlatform});

  final List<dynamic> selectedPlatform;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: selectedPlatform.map((platform) {
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child:
              Image.asset('assets/images/${platform}.png', // 💥 SNS 파일명 확인해보기
                  width: 20,
                  height: 20),
        );
      }).toList(),
    );
  }
}
