import 'package:crunchshop/app.dart';
import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/controllers/theme_controller.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<Loc>(() => Loc().init(), permanent: true);

  await Get.putAsync<ThemeController>(() => ThemeController.init(),
      permanent: true);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // status bar color setup
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.black54,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      PrefUtils().init();
      Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
      runApp(const MyApp());
    },
  );
}
