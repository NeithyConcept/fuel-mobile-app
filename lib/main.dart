
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitemoncarburant/constants/colors.dart';
import 'package:vitemoncarburant/widgets/survey/fuel.dart';

void main() => runApp(const Application());
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ViteMonCarburant',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: GoogleFonts.inter().fontFamily),
      home: const FuelPage(),
    );
  }
}
