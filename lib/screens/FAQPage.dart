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
                  future: FAQ.getSteps(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FAQExtendedList(FAQlist: snapshot.data ?? []);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          )),

      // body: Center(
      //   child: SizedBox(
      //     width: 980,
      //     child: ListView(
      //       children: [
      //         Image.asset(
      //           "assets/faq-back.jpg",
      //           height: 150,
      //           // width: double.infinity,
      //           fit: BoxFit.cover,
      //         ),
      //         Column(
      //           children: [
      //             const Padding(
      //               padding: EdgeInsets.all(8.0),
      //               child: Text(
      //                   "Этот блок помогает абитуриентам получить необходимую информацию о поступлении, учебных программах, сроках и процедурах. В блоке 'Вопрос-ответ' пользователь может задать свой вопрос, используя удобный интерфейс приложения."),
      //             ),
      //             const Divider(),
      //
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      drawer: const NavBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.question_answer),
        onPressed: () {},
      ),
    );
  }
}

class FAQExtendedList extends StatefulWidget {
  final List<FAQ> FAQlist;
  const FAQExtendedList({super.key, required this.FAQlist});

  @override
  State<FAQExtendedList> createState() => _FAQExtendedListState(faq: FAQlist);
}

class _FAQExtendedListState extends State<FAQExtendedList> {
  final List<FAQ> _faqList;
  _FAQExtendedListState({required List<FAQ> faq}) : _faqList = faq;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _faqList[index].isExpanded = isExpanded;
        });
      },
      children: _faqList.map<ExpansionPanel>((FAQ faqItem) {
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  faqItem.q ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              );
            },
            canTapOnHeader: true,
            body: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faqItem.a ?? ''),
                )
              ],
            ),
            isExpanded: faqItem.isExpanded);
      }).toList(),
    );
  }
}
