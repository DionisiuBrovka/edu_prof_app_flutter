import 'package:edu_prof_app_flutter/screens/HomePage.dart';
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
        home: const HomePage(),
        debugShowCheckedModeBanner: false);
  }
}
