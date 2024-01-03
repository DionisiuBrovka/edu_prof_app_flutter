import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String test = """
Добро пожаловать в приложение "Абитуриент"! Здесь вы найдете все необходимые сведения, руководства и ресурсы для успешного поступления в университет. Мы готовы помочь вам на каждом шагу пути. Удачи в вашем будущем образовании!

## Разделы

---
 - Главная страница
 - Избранное
 - Учреждения образования
 - Специальности
 -  Мероприятия
---

""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
      ),
      body: WideTemplate(
        head: Image.asset(
          "assets/fon.png",
          height: 150,
          // width: double.infinity,
          fit: BoxFit.cover,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MarkdownBody(
            data: test,
          ),
        ),
      ),
      drawer: const NavBar(),
    );
  }
}
