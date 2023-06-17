import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class MyPostsScreens extends StatelessWidget {
  const MyPostsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:  12,
            vertical: 15,
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'my_posts'.tr(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.arrow_back_ios,color: AppColors.white,),
          ),
        ),
      ),
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {},
            child: ListView.separated(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: index % 2 != 0
                            ? AppColors.error
                            : AppColors.primary,
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        colors: index % 2 == 0
                            ? AppColors.linearNotification1Colors
                            : AppColors.linearNotification2Colors,
                      ),
                    ),
                    // elevation: 6,
                    child: Container(
                      height: 120,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 12,
                                    ),
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
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(18),
                                    bottomLeft: Radius.circular(18)),
                                color: index % 2 == 0
                                    ? AppColors.primary.withOpacity(0.7)
                                    : AppColors.error.withOpacity(0.7),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('31/1/2023   11:00 Am'),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primary),
                                          child: Icon(
                                            Icons.favorite,
                                            color: AppColors.error,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primary),
                                          child: Icon(
                                            Icons.share,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primary,
                                          ),
                                          child: Icon(
                                            Icons.flag,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
            ),
          ),
        ),
      ),
    );
  }
}
