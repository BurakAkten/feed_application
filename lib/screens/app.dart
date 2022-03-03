import 'package:feed_application/translations/locale_keys.g.dart';
import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../base/constants/app_theme.dart';
import 'feed/feed_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'en';
    return Listener(
      behavior: HitTestBehavior.translucent,
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          title: LocaleKeys.appName.locale,
          theme: AppTheme().theme,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          supportedLocales: context.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) => context.fallbackLocale,
          home: const FeedScreen(),
        ),
      ),
    );
  }
}
