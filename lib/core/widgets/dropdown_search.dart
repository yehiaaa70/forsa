import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/feature/register/cubit/register_cubit.dart';
import 'package:forsa/feature/register/cubit/register_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class DropdownSearchWidget extends StatelessWidget {
  const DropdownSearchWidget({
    Key? key,
    required this.dropdownList,
    required this.icon,
    required this.labelText,
    required this.isEnable,
    this.kind = "null",
    this.update = "null",
    this.cubit,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);
  final List<String> dropdownList;
  final IconData icon;
  final String labelText;
  final bool isEnable;
  final String? kind;
  final String? update;
  final Color? backgroundColor;

  final Cubit? cubit;

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    List<String> ids = [];
    for (var element in dropdownList) {
      items.add(element.split("/")[0]);
      ids.add(element.split("/")[1]);
    }

    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          RegisterCubit cubit = context.read<RegisterCubit>();
          return DropdownSearch<String>(
            dropdownButtonProps: DropdownButtonProps(
              color: AppColors.blueColor1,
            ),
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              menuProps: MenuProps(
                backgroundColor: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              fit: FlexFit.loose,
            ),
            enabled: isEnable,
            items: items,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(color: AppColors.primary),
              dropdownSearchDecoration: InputDecoration(
                fillColor: backgroundColor,
                filled: true,
                enabled: true,
                isCollapsed: false,
                hintText: labelText,
                iconColor: AppColors.primary,
                focusColor: AppColors.primary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: icon == Icons.abc
                    ? null
                    : Icon(
                        icon,
                        color: AppColors.primary,
                      ),
              ),
            ),
            autoValidateMode: AutovalidateMode.always,
            onChanged: (text) {
              if (labelText == 'city'.tr()) {
                cubit.cityId = ids[items.indexOf(text!)];
              } else if (labelText == 'currentJobStatus'.tr()) {
                cubit.currentJobStatusId = ids[items.indexOf(text!)];
              } else if (labelText == 'jobCategory'.tr()) {
                cubit.jobCategoriesId = ids[items.indexOf(text!)];
              } else {
                cubit.roleId = ids[items.indexOf(text!)];
              }
            },
          );
        },
      ),
    );
  }
}
