import 'package:clean_code_app/core/commons/widgets/gradient_background.dart';
import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderCostruction extends StatelessWidget {
  const PageUnderCostruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          image: MediaResources.onBoardingBackground,
          child: Lottie.asset(MediaResources.pageUnderConstruction),),
    );
  }
}
