import 'package:clean_code_app/core/commons/app/providers/user_provider.dart';
import 'package:clean_code_app/core/commons/extensions/context_extension.dart';
import 'package:clean_code_app/core/resources/colors.dart';
import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, __) {
      final user = provider.user;
      final image = user?.profilePic == null || user!.profilePic!.isEmpty
          ? null
          : user.profilePic;
      return Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: image != null
                ? NetworkImage(image)
                : const AssetImage(MediaResources.user) as ImageProvider,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user?.fullName ?? 'No User',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          if (user?.bio != null && user!.bio!.isNotEmpty) ...[
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .15),
              child: Text(
                user.bio!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colours.neutralTextColour,
                ),
              ),
            ),
          ],
          const SizedBox(
            height: 16,
          ),
        ],
      );
    });
  }
}
