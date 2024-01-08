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
# Добро пожаловать в приложение "Абитуриент Минск"! 

Здесь вы найдете все необходимые сведения, руководства и ресурсы для успешного поступления в университет. Мы готовы помочь вам на каждом шагу пути. Удачи в вашем будущем образовании!

## Разделы

---

 - **Главная страница** - Вы находитесь тут

 - **Учреждения образования** - Здесь вы сможете узнать актуальную информацию об УО г. Минска, узнать когда и как начать получать будущую проффесию
 - **Специальности** - Список сортированый специальностей
 -  **Мероприятия** - Список сортированый мероприятия
 
 ![](https://img.freepik.com/free-vector/finance-leaders-concept-illustration_114360-7243.jpg?w=1380&t=st=1704719116~exp=1704719716~hmac=aac7261e96fe154bd50a54b7710b2fa94eaa5d06c4fcfa44233dd6053bd2d755)


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
