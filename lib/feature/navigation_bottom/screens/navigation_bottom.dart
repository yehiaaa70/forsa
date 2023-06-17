import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/utils/app_colors.dart';
import 'package:forsa/core/widgets/custom_textfield.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../chat/screens/conversation_page.dart';
import '../../favourite/screens/favourite.dart';
import '../../home/screens/home_page.dart';
import '../../notification/screens/notification.dart';
import '../../profile/screens/profile_screen.dart';
import '../cubit/navigator_bottom_cubit.dart';
import '../widget/navigation_bottom_widget.dart';
import 'dart:math' as math;

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  // final LoginModel loginModel;

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(FocusNode());
    return BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
      builder: (context, state) {
        NavigatorBottomCubit bottomCubit = context.read<NavigatorBottomCubit>();
        _page = bottomCubit.page;
        return Stack(
          children: [
            Scaffold(
              // resizeToAvoidBottomInset: false,
              appBar: _page == 4
                  ? null
                  : AppBar(
                      toolbarHeight: _page != 0 ? null :95,
                      backgroundColor: AppColors.primary,
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _page == 0 ? 0 : 12,
                          vertical: 15,
                        ),
                        child: appbar(),
                      ),
                      elevation: 0,
                    ),
              bottomNavigationBar: Container(
                color: AppColors.transparent,
                height: 60,
                child: NavigatorBottomWidget(),
              ),
              body: BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
                builder: (context, state) {
                  if (bottomCubit.page == 0) {
                    return HomeScreen();
                  } else if (bottomCubit.page == 1) {
                    return NotificationScreen();
                  } else if (bottomCubit.page == 2) {
                    return FavouriteScreen();
                  } else if (bottomCubit.page == 3) {
                    return ConversationPage();
                  } else {
                    return ProfileScreen();
                  }
                },
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      bottomCubit.changePage(2, 'favourite'.tr());
                    },
                    child: Card(
                      elevation: 20,
                      shadowColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MySvgWidget(
                              path: ImageAssets.favouriteIcon,
                              imageColor: bottomCubit.page == 2
                                  ? AppColors.error
                                  : AppColors.gray.withOpacity(0.5),
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget appbar() {
    if (_page == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
            child: Text(
              'مرحبا أحمد يحيى',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: MySvgWidget(
                    size: 24,
                    path: ImageAssets.filterIcon,
                    imageColor: AppColors.black,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    // controller: controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2),
                          MySvgWidget(
                            size: 22,
                            path: ImageAssets.searchIcon,
                            imageColor: AppColors.black,
                          ),
                        ],
                      ),
                      hintText: 'what_you_search'.tr(),
                      labelStyle: TextStyle(color: AppColors.black),
                      hintStyle: TextStyle(color: AppColors.black),
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                    ),
                    autofocus: false,
                    onTapOutside: (pointer){
                    },
                  ),
                ),
              ),
              SizedBox(width: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySvgWidget(
                    path: ImageAssets.pinLocationIcon,
                    imageColor: AppColors.white,
                    size: 28,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'الرياض',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      );
    } else if (_page == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'notification'.tr(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (_page == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'favourite'.tr(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (_page == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'chat'.tr(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
