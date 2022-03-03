import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:feed_application/screens/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async {
      runApp(EasyLocalization(
        supportedLocales: const [Locale('en')],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: App(),
      ));
    },
    (_, __) {},
    zoneSpecification: ZoneSpecification(print: (Zone self, ZoneDelegate parent, Zone zone, String message) {
      if (kDebugMode) {
        parent.print(zone, '${"Feed App"} ${DateTime.now()}: $message');
      }
    }),
  );
}
