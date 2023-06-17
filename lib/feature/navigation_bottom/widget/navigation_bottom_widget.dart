import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/widgets/my_svg_widget.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../cubit/navigator_bottom_cubit.dart';

class NavigatorBottomWidget extends StatelessWidget {
  NavigatorBottomWidget({Key? key}) : super(key: key);
  late int _page = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
      builder: (context, state) {
        NavigatorBottomCubit bottomCubit = context.read<NavigatorBottomCubit>();

        _page = bottomCubit.page;
        return Stack(
          children: [
            Column(
              children: [
                // const SizedBox(height: 30),
                Expanded(
                  child: CustomNavigationBar(
                    iconSize: 30.0,
                    backgroundColor: AppColors.white,
                    strokeColor: AppColors.white,
                    currentIndex: _page,
                    items: [
                      CustomNavigationBarItem(
                        icon: MySvgWidget(
                          path: ImageAssets.homeIcon,
                          imageColor: _page == 0
                              ? AppColors.primary
                              : AppColors.gray.withOpacity(0.5),
                          size: 32,
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: MySvgWidget(
                          path: ImageAssets.notificationIcon,
                          imageColor: _page == 1
                              ? AppColors.primary
                              : AppColors.gray.withOpacity(0.5),
                          size: 32,
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: const SizedBox(),
                      ),
                      CustomNavigationBarItem(
                        icon: MySvgWidget(
                          path: ImageAssets.chatIcon,
                          imageColor: _page == 3
                              ? AppColors.primary
                              : AppColors.gray.withOpacity(0.5),
                          size: 32,
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: MySvgWidget(
                          path: ImageAssets.profileIcon,
                          imageColor: _page == 4
                              ? AppColors.primary
                              : AppColors.gray.withOpacity(0.5),
                          size: 32,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      bottomCubit.changePage(
                        index,
                        [
                          'home'.tr(),
                          'notification'.tr(),
                          'favourite'.tr(),
                          'chat'.tr(),
                          'profile'.tr()
                        ].elementAt(index),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Positioned(
            //   top: 2,
            //   right: 0,
            //   left: 0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           bottomCubit.changePage(2, 'favourite'.tr());
            //         },
            //         child: Card(
            //           elevation: 15,
            //           shadowColor: AppColors.primary,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(40),
            //           ),
            //           child: SizedBox(
            //             width: 50,
            //             height: 50,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 MySvgWidget(
            //                   path: ImageAssets.favouriteIcon,
            //                   imageColor: _page == 2
            //                       ? AppColors.primary
            //                       : AppColors.gray.withOpacity(0.5),
            //                   size: 32,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
