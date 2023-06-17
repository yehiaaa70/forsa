import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/feature/profile/cubit/profile_cubit.dart';
import 'package:forsa/feature/profile/cubit/profile_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../widgets/header_widget.dart';
import '../widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = context.read<ProfileCubit>();
          return SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Text(
                      'myProfile'.tr(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    expandedHeight: 330,
                    pinned: true,
                    centerTitle: true,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                    backgroundColor: AppColors.primary.withOpacity(0.8),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: HeaderWidget(),
                    ),
                  )
                ];
              },
              body: ProfileBody(),
            ),
          );
        },
      ),
    );
  }
}
