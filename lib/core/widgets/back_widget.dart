import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key, required this.size}) : super(key: key);

  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(45 / 360),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.secondPrimary.withOpacity(0.2),
            ),
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(135 / 360),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
