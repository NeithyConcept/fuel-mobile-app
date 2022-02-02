
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitemoncarburant/app/core/utils/scroll_behavior.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';
import 'package:vitemoncarburant/app/data/services/storage_service.dart';
import 'package:vitemoncarburant/app/modules/home/binding.dart';
import 'package:vitemoncarburant/app/modules/home/view.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['API_URL']!;
}

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  await Get.putAsync(() => StorageServices().init());
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: grey,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ViteMonCarburant',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: GoogleFonts.inter().fontFamily),
      home: HomeView(),
      initialBinding: HomeBinding(),
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = ScrollConfiguration(behavior: MyBehavior(), child: child);
        return child;
      },
    );
  }
}
