import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderCostruction extends StatelessWidget {
  const PageUnderCostruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaResources.onBoardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child:
              Center(child: Lottie.asset(MediaResources.pageUnderConstruction)),
        ),
      ),
    );
  }
}
