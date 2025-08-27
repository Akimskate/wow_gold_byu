import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wow_gold_buy_v3/constants.dart';
import 'screens/home/home_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoW Goldbuy Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        canvasColor: bgColor,
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}
