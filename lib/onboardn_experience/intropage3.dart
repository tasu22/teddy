import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teddy/pages/homepage';
import 'package:teddy/widgets/custom_outlined_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intropage3 extends StatelessWidget {
  final PageController controller;

  const Intropage3({super.key, required this.controller});

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
              'assets/animations/social.json',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Enjoy all the social media platforms without any restrictions and dont forget to go premium else we will have to show you ads🙈',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF008080)),
          ),
          const SizedBox(height: 20),
          CustomOutlinedButton(
            onPressed: () async {
              // Mark onboarding as complete
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('onboarding_complete', true);

              // Check if context is still mounted before navigating
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              }
            },
            child: const Text('G E T  S T A R T E D'),
          ),
        ],
      ),
    );
  }
}
