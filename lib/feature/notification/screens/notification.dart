import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';

import '../../../core/utils/assets_manager.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              ...List.generate(
                12,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // border: Border.all(
                      //   color: index % 2 != 0
                      //       ? AppColors.error
                      //       : AppColors.primary,
                      //   width: 2,
                      // ),
                      gradient: LinearGradient(
                        end : Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        colors: index % 2 == 0
                            ? AppColors.linearNotification1Colors
                            :  AppColors.linearNotification2Colors,
                      ),
                    ),
                    // elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.logoImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'تطوير الأنظمة وموقع العمادة باستخدام لغات البرمجة اللازمة مثل php• تطوير تطبيقات الجوال لنظامي IOS و Android باستخدام android java و ios objective c. • اختبار عمل البرامج والتطبيقات واكتشاف الأخطاء.• تقديم الدعم وعمل التحسينات والتطوير المستمر للتطبيقات والأنظمة.• تشخيص مشكلات البرامج واقتراح الحلول.• تقديم التدريب اللازم والأدلة الخاصة بالتطبيقات والبرامج المطورة.',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
