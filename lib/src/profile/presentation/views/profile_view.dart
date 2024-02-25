import 'package:clean_code_app/core/commons/widgets/gradient_background.dart';
import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:clean_code_app/src/profile/presentation/widgets/profile_app_bar.dart';
import 'package:clean_code_app/src/profile/presentation/widgets/profile_body.dart';
import 'package:clean_code_app/src/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(),
      body: GradientBackground(
        image: MediaResources.profileGradientBackground,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            ProfileHeader(),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
