import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/utils/assets_manager.dart';
import 'package:forsa/core/widgets/my_svg_widget.dart';
import 'package:forsa/feature/profile/cubit/profile_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/avater_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = context.read<ProfileCubit>();
        return Container(
          color: AppColors.primary.withOpacity(0.1),
          margin: EdgeInsets.only(top: 60),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: ClipOval(
                            child: cubit.profilePhoto.isEmpty
                                ? Image.asset(
                              ImageAssets.avatarImage,
                            )
                                : SizedBox(
                              width: 90,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(140),
                                child: Image.memory(
                                  base64.decode(cubit.profilePhoto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 120,
                      //   height: 120,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(140),
                      //     child: Image.memory(
                      //       base64.decode('cubit.base64Image'),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

                  // CachedNetworkImage(
                  //         imageBuilder: (context, imageProvider) {
                  //           return Container(
                  //             width: 96.0,
                  //             height: 96.0,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               border: Border.all(
                  //                 color: AppColors.primary,
                  //                 width: 1,
                  //               ),
                  //             ),
                  //             child: CircleAvatar(
                  //               radius: 96.0,
                  //               backgroundImage: imageProvider,
                  //             ),
                  //           );
                  //         },
                  //         imageUrl: 'https://elmazone.topbusiness.io/users/avatar2.jpg',
                  //         width: 96.0,
                  //         height: 96.0,
                  //         placeholder: (context, url) {
                  //           return AvatarWidget(size: 96);
                  //         },
                  //         errorWidget: (context, url, error) {
                  //           return AvatarWidget(size: 96);
                  //         },
                  //       ),
                  // : AvatarWidget(),
                  SizedBox(width: 20.0),
                  Column(
                    children: [
                      Text(
                        'أحمد يحيى',
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                // navigateToUserSignUpActivity();
                              },
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(
                                  width: 1.0,
                                  color: AppColors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 8.0),
                              child: Text(
                                'edit_profile'.tr(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.iconProfileColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              onPressed: () {
                                // cubit.deleteUserAccount();
                              },
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(
                                  width: 1.0,
                                  color: AppColors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 8.0),
                              child: Text(
                                'delete_profile'.tr(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.iconProfileColor,
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      MaterialButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed(AppConstant.pageAddPostRoute)
                          //     .then((value) => {cubit.getPosts()});
                        },
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide(
                            width: 1.0,
                            color: AppColors.white,
                          ),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                        child: Text(
                          'addPost'.tr(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.iconProfileColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySvgWidget(
                    path: ImageAssets.calenderIcon,
                    imageColor: AppColors.black,
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '7/5/5/1998',
                    style: TextStyle(fontSize: 16.0, color: AppColors.black),
                  ),
                  SizedBox(width: 8),
                  MySvgWidget(
                    path: ImageAssets.pinLocationIcon,
                    imageColor: AppColors.black,
                    size: 28,
                  ),
                  Expanded(
                    child: Text(
                      'الرياض',
                      style: TextStyle(fontSize: 16.0, color: AppColors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
            ],
          ),
        );
      },
    );
  }
}
