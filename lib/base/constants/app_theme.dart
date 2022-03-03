import 'package:flutter/material.dart';
import 'app_constants.dart';

class AppTheme {
  var _lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.content,
    iconTheme: IconThemeData(color: AppColors.content, size: AppIconSize.medium),
    textTheme: TextTheme(
      headline6: TextStyle(color: AppColors.content, fontWeight: AppFontUtils.medium, fontSize: AppFontUtils.headline6),
      subtitle2: TextStyle(color: AppColors.content, fontWeight: AppFontUtils.bold, fontSize: AppFontUtils.subtitle2),
      bodyText2: TextStyle(color: AppColors.content, fontWeight: AppFontUtils.regular, fontSize: AppFontUtils.body2),
      button: TextStyle(color: AppColors.content, fontWeight: AppFontUtils.medium, fontSize: AppFontUtils.button),
      caption: TextStyle(color: AppColors.content, fontWeight: AppFontUtils.regular, fontSize: AppFontUtils.caption),
    ),
  );

  //getters
  ThemeData get theme => _lightTheme;
}
