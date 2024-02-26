import 'package:clean_code_app/core/commons/widgets/gradient_background.dart';
import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:clean_code_app/src/home/presentation/refactors/home_body.dart';
import 'package:clean_code_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(),
      body: GradientBackground(
        image: MediaResources.homeGradientBackground,
        child: HomeBody(),
      ),
    );
  }
}
