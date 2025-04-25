import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teddy/onboardn_experience/intropage1.dart';
import 'package:teddy/onboardn_experience/intropage2.dart';
import 'package:teddy/onboardn_experience/intropage3.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Intropage1(controller: controller),
              Intropage2(
                controller: controller,
              ), // Update these if they also need the controller
              Intropage3(controller: controller),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: controller, count: 3),
          ),
        ],
      ),
    );
  }
}
