import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/assets_manager.dart';
import '../../add_post/screens/add_post_screen.dart';
import '../../my_posts/screens/my_posts_screen.dart';
import '../../navigation_bottom/screens/navigation_bottom.dart';
import '../widgets/home_page_icon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height-180,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                  ),
                  HomePageIconWidget(
                    title: 'posts'.tr(),
                    heroTag: 'postsTag',
                    imagePath: ImageAssets.postsImage,
                    onclick: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          alignment: Alignment.topCenter,
                          duration: const Duration(milliseconds: 700),
                          child: AddPostScreen(),
                          childCurrent: NavigationBottom(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 25),
                  HomePageIconWidget(
                    title: 'jobs'.tr(),
                    heroTag: 'jobsTag',
                    imagePath: ImageAssets.searchJobImage,
                    onclick: () {},
                  ),
                  SizedBox(height: 25),
                  HomePageIconWidget(
                    title: 'my_posts'.tr(),
                    heroTag: 'myPostsTag',
                    imagePath: ImageAssets.myPostsImage,
                    onclick: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          alignment: Alignment.topCenter,
                          duration: const Duration(milliseconds: 700),
                          child: MyPostsScreens(),
                          childCurrent: NavigationBottom(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
