import 'package:flutter/material.dart';
import 'package:teddy/widgets/custom_outlined_button.dart';

class Intropage1 extends StatelessWidget {
  final PageController controller;

  const Intropage1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008080),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'W E L C O M E  T O  T E D D Y  ',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/teddyicon.png'),
          ),
          const SizedBox(height: 20),
          Text(
            'Sophisticated and most minimalist VPN ',
            style: TextStyle(fontSize: 16, color: Colors.green[100]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          CustomOutlinedButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            borderColor: Colors.green.shade100,
            child: Text('N E X T', style: TextStyle(color: Colors.green[100])),
          ),
          CustomOutlinedButton(
            onPressed: () {
              controller.jumpToPage(2);
            },
            borderColor: Colors.green.shade100,
            child: Text('S K I P', style: TextStyle(color: Colors.green[100])),
          ),
        ],
      ),
    );
  }
}
