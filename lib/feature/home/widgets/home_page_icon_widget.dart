import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';

class HomePageIconWidget extends StatelessWidget {
  const HomePageIconWidget(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.onclick, required this.heroTag})
      : super(key: key);

  final String title;
  final String heroTag;

  final String imagePath;

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onclick,
          child: Stack(
            children: [
              Card(
                color: AppColors.scaffoldBackground,
                elevation: 16,
                shadowColor: AppColors.secondPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        // Spacer(),
                        Hero(
                          tag: heroTag,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Spacer(),
                        Image.asset(
                          imagePath,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Icon(
                  Icons.arrow_drop_down_circle_rounded,
                  size: 40,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
