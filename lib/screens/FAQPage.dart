import 'package:edu_prof_app_flutter/elements/FAQExtendedListView.dart';
import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/models/FAQ.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вопрос ответ'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
      ),
      body: WideTemplate(
          ebanuilist: false,
          head: Image.asset(
            "assets/faq-back.jpg",
            height: 150,
            // width: double.infinity,
            fit: BoxFit.cover,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Этот блок помогает абитуриентам получить необходимую информацию о поступлении, учебных программах, сроках и процедурах. В блоке 'Вопрос-ответ' пользователь может задать свой вопрос, используя удобный интерфейс приложения."),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: FAQ.getFAQList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FAQExtendedListView(FAQlist: snapshot.data ?? []);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          )),
      drawer: const NavBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.question_answer),
        onPressed: () {},
      ),
    );
  }
}
