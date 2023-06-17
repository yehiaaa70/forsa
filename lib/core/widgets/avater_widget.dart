import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, required this.size}) : super(key: key);
final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 1),
        image: DecorationImage(
          image: AssetImage(ImageAssets.avatarImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
