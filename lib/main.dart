import 'package:edu_prof_app_flutter/screens/EstablishmentListPage.dart';
import 'package:edu_prof_app_flutter/screens/EventsPage.dart';
import 'package:edu_prof_app_flutter/screens/FAQPage.dart';
import 'package:edu_prof_app_flutter/screens/FavoritePage.dart';
import 'package:edu_prof_app_flutter/screens/HomePage.dart';
import 'package:edu_prof_app_flutter/screens/ProffTest.dart';
import 'package:edu_prof_app_flutter/screens/SpecialtyListPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: const Locale.fromSubtags(languageCode: 'ru'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 96, 183)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/favorite': (context) => FavoritePage(),
        '/establishment': (context) => EstablishmentListPage(),
        '/specialty': (context) => SpecialtyListPage(),
        '/events': (context) => EventsPage(),
        // ignore: prefer_const_constructors
        '/profftest': (context) => ProffTest(),
        '/faq': (context) => FAQPage(),
      },
    );
  }
}
