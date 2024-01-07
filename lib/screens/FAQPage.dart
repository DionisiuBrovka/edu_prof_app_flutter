import 'dart:convert';

import 'package:edu_prof_app_flutter/elements/FAQExtendedListView.dart';
import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/models/FAQ.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputPhoneController = TextEditingController();
  final _inputEmailController = TextEditingController();
  final _inputQController = TextEditingController();

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
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Если вы не нашли ответ на свой вопрос, напишите нам \nИ мы ответим вам",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black38, fontSize: 16),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.question_answer),
            onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    //icon: FaIcon(FontAwesomeIcons.folderMinus),
                    title: const Text("Задайте свой вопросс"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FAQaskView(
                        formKey: _formKey,
                        phoneControler: _inputPhoneController,
                        eMailControler: _inputEmailController,
                        qControler: _inputQController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: const Text("Отмена")),
                      FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context, rootNavigator: true).pop();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Ваш вопрос успешно отправлен'),
                                      content: const Text(
                                          'Мы уведомим вас как только найдем ответ на ваш вопрос'),
                                      actions: [
                                        FilledButton(
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    );
                                  });

                              await http.post(
                                  Uri(
                                    scheme: 'https',
                                    host: "noco.dionisiubrovka.online",
                                    path:
                                        '/api/v1/db/data/noco/pcnlhd6co7jk660/QA',
                                  ),
                                  headers: {
                                    'Content-Type':
                                        'application/x-www-form-urlencoded',
                                    'xc-auth':
                                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRldi5kaW9uaXNpdS5icm92a2FAZ21haWwuY29tIiwiaWQiOiJ1c2YwYnNlNjZlN2JqYTV1Iiwicm9sZXMiOnsib3JnLWxldmVsLWNyZWF0b3IiOnRydWUsInN1cGVyIjp0cnVlfSwidG9rZW5fdmVyc2lvbiI6IjExMDk3Y2M3M2EzYmZlMzUzODg0NmRiYzQ5ODE4YzJhMzE2YWYyMWM4ZTNmZjA1ZGRjYThlNmEwYTQ5NDcxNjgyODkwYjc0N2I1ODAyMzhkIiwiaWF0IjoxNzA0NjQ2MDEzLCJleHAiOjE3MDQ2ODIwMTN9.DyV4IOV0Q9OA5xZfZImL1gCk0XaCA6WUHdX4344lIVw'
                                  },
                                  encoding: Encoding.getByName('utf-8'),
                                  body: {
                                    'q': _inputQController.text,
                                    'phone': _inputPhoneController.text,
                                    'email': _inputEmailController.text
                                  });
                            }
                          },
                          child: const Text("Отправить"))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? isMultiLine;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const InputField(
      {super.key,
      required this.label,
      required this.hint,
      this.isMultiLine,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: isMultiLine != null && isMultiLine! ? 4 : 1,
      maxLines: isMultiLine != null && isMultiLine! ? 8 : 1,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class FAQaskView extends StatelessWidget {
  final GlobalKey formKey;
  final TextEditingController phoneControler;
  final TextEditingController eMailControler;
  final TextEditingController qControler;
  const FAQaskView({
    super.key,
    required this.formKey,
    required this.phoneControler,
    required this.eMailControler,
    required this.qControler,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                label: "Моб. телефон",
                hint: " +375(_ _)_ _ _ _ _ _ _ ",
                validator: (value) {
                  String patttern =
                      r'^((8|\+374|\+994|\+995|\+375|\+7|\+380|\+38|\+996|\+998|\+993)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1})?$';
                  RegExp regExp = RegExp(patttern);
                  if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Введите корректный номер телефона';
                  }
                  return null;
                },
                controller: phoneControler,
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                label: "Электронная почта",
                hint: " exzample@mail.con ",
                validator: (value) {
                  String patttern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(patttern);
                  if (value == null || value.isEmpty) {
                    return 'Введите электронную почту';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Введите корректную электронную почту';
                  }
                  return null;
                },
                controller: eMailControler,
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                label: "Вопрос",
                hint: "... ",
                isMultiLine: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Вопрос не может быть пустым";
                  } else {
                    return null;
                  }
                },
                controller: qControler,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
