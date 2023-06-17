import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

PreferredSizeWidget CustomAppBarWidget({required String appBarTitle}){
  return AppBar(
    toolbarHeight: 50,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Text(appBarTitle),
    ),
  );
}