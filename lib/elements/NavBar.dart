import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_outlined),
            title: const Text('Избраное'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/favorite', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Учреждение образования'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/establishment', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Специальности'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/specialty', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Мероприятия'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/events', ModalRoute.withName('/'))
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Документы для поступления'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/documents', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.today),
            title: const Text('Сроки подачи документов'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/deadlines', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_timeline),
            title: const Text('График работы комисии'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/schedule', ModalRoute.withName('/'))
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Профорентационный тест'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/profftest', ModalRoute.withName('/'))
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: const Text('Вопрос ответ'),
            onTap: () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/faq', ModalRoute.withName('/'))
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
                  applicationIcon: const Icon(Icons.ads_click_rounded))
            },
          ),
        ],
      ),
    );
  }
}
