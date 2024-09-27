// Profile Picture Widget
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfilePicture extends StatelessWidget {
  final String profileImageUrl;

  const ProfilePicture({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "profile",
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
          image: DecorationImage(
              image: NetworkImage(profileImageUrl), fit: BoxFit.cover),
        ),
      )
          .animate()
          .scaleXY(
              begin: 0.0,
              end: 1.0,
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate)
          .fadeIn()
          .blurXY(begin: 10, end: 0),
    );
  }
}
