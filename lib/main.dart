import 'package:cbot/homepage.dart';
import 'package:cbot/pallet.dart';
import 'package:flutter/material.dart';

//what is the name of the company and what are they providing
//ما الخدمات التي يقدمها الشركة
//how can i contact the company or have a consultation with them
//what is the temperature now in egypt
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CBOT',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
          iconTheme: IconThemeData(color: Pallete.blackColor),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold();
// }
