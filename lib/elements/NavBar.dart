import 'package:edu_prof_app_flutter/screens/DeadlinesPage.dart';
import 'package:edu_prof_app_flutter/screens/DocumentsPage.dart';
import 'package:edu_prof_app_flutter/screens/EstablishmentListPage.dart';
import 'package:edu_prof_app_flutter/screens/EventsListPage.dart';
import 'package:edu_prof_app_flutter/screens/FAQPage.dart';
import 'package:edu_prof_app_flutter/screens/FavoritePage.dart';
import 'package:edu_prof_app_flutter/screens/HomePage.dart';
import 'package:edu_prof_app_flutter/screens/ProffTestPage.dart';
import 'package:edu_prof_app_flutter/screens/SchedulePage.dart';
import 'package:edu_prof_app_flutter/screens/SkillListPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "Меню навигации",
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('АБИТУРИЕНТ'),
            accountEmail: Text("Приложение помощник"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/header-back.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Главная'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                  return HomePage();
                }));
              }),
          ListTile(
            leading: const Icon(Icons.star_outlined),
            title: const Text('Избраное'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return FavoritePage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Учреждение образования'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return EstablishmentListPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Специальности'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return SkillListPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Мероприятия'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return EventsListPage();
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Документы для поступления'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return DocumentsPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.today),
            title: const Text('Сроки подачи документов'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return DeadlinesPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_timeline),
            title: const Text('График работы комисии'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return SchedulePage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Профорентационный тест'),
            onTap: () {
              if (kIsWeb || Platform.isWindows) {
                launchUrl(Uri.parse('https://profitest.ripo.by/public/main'));
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                  return ProffTestPage();
                }));
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: const Text('Вопрос ответ'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                return FAQPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('О приложении'),
            onTap: () => {
              showAboutDialog(
                  context: context,
                  applicationName: 'Абитуриент',
                  applicationVersion: '0.0.1a',
                  children: [const Text('разработал: Бровка Д.С.')],
                  applicationIcon: const Icon(Icons.ads_click_rounded))
            },
          ),
        ],
      ),
    );
  }
}
