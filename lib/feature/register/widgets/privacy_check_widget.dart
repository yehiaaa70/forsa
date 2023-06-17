import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';

class PrivacyCheckWidget extends StatefulWidget {
  const PrivacyCheckWidget({Key? key}) : super(key: key);

  @override
  State<PrivacyCheckWidget> createState() => _PrivacyCheckWidgetState();
}

class _PrivacyCheckWidgetState extends State<PrivacyCheckWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isCheck,
          onChanged: (value) {
            setState(() {
              isCheck = value!;
            });
          },
        ),
        SizedBox(width: 8),
        Text(
          'privacy_check'.tr(),
          style: TextStyle(color: AppColors.blueColor1),
        )
      ],
    );
  }
}
