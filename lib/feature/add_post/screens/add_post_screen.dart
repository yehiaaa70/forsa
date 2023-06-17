import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/back_widget.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/expansion_tile_widget.dart';
import '../../payment/screen/pay_screen.dart';
import '../widgets/choose_connection_widget.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);
  final customController = GroupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: SizedBox(
          width: 0,
        ),
        leadingWidth: 20,
        titleSpacing: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'posts'.tr(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BackWidget(size: 30),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 25,
              ),
              child: Text(
                'choose_section'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.black,
                ),
              ),
            ),
            EntryItem(title: 'section'.tr()),
            SizedBox(height: 12),
            EntryItem(title: 'job_location'.tr()),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextFormField(
                // controller: controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'connected_phone'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
            ChooseConnectionWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextFormField(
                // controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'email'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                SizedBox(width: 24),
                Icon(
                  Icons.warning,
                  color: Colors.yellow,
                  size: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'post_waring'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TextFormField(
                // controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'post_content'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                ),
                maxLines: 20,
                minLines: 5,
                validator: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.white, width: 2),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.7),
                        AppColors.primary.withOpacity(0.5),
                        AppColors.primary.withOpacity(0.3),
                        AppColors.primary.withOpacity(0.2),
                        AppColors.primary.withOpacity(0.0),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'post'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.white, width: 2),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.success,
                          AppColors.success.withOpacity(0.7),
                          AppColors.success.withOpacity(0.5),
                          AppColors.success.withOpacity(0.3),
                          AppColors.success.withOpacity(0.2),
                          AppColors.success.withOpacity(0.0),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.vipPostImage,
                            width: 35,
                            height: 35,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'vip_post'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
