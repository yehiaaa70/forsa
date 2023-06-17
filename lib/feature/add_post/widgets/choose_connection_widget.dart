import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/utils/app_colors.dart';

class ChooseConnectionWidget extends StatefulWidget {
  const ChooseConnectionWidget({Key? key}) : super(key: key);

  @override
  State<ChooseConnectionWidget> createState() => _ChooseConnectionWidgetState();
}

class _ChooseConnectionWidgetState extends State<ChooseConnectionWidget> {
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "only_whatsapp".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gender == 'whatsapp' ? AppColors.white : AppColors.black,
                  ),
                ),
                value: "whatsapp",
                activeColor: AppColors.primary,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "only_call".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gender == 'call' ? AppColors.white : AppColors.black,
                  ),
                ),
                value: "call",
                groupValue: gender,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "call_and_whatsapp".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gender == 'callAndWhatsapp'
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                value: "callAndWhatsapp",
                activeColor: AppColors.primary,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "only_chat".tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gender == 'chat' ? AppColors.white : AppColors.black,
                  ),
                ),
                value: "chat",
                activeColor: AppColors.primary,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
