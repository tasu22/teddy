import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teddy/widgets/custom_outlined_button.dart';

class Intropage2 extends StatelessWidget {
  final PageController controller;

  const Intropage2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            child: Lottie.asset(
              'assets/animations/location.json',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Watch all TV shows and movies without location restrictions',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF008080)),
          ),
          const SizedBox(height: 20),
          CustomOutlinedButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: const Text('N E X T'),
          ),
          CustomOutlinedButton(
            onPressed: () {
              controller.jumpToPage(2);
            },
            child: const Text('S K I P'),
          ),
        ],
      ),
    );
  }
}
