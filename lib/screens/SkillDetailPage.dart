import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:edu_prof_app_flutter/viewHolders/EstablishmentViewHolder.dart';
import 'package:edu_prof_app_flutter/viewHolders/EstablishmentViewHolderWithoutSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SkillDetailPage extends StatefulWidget {
  final int uID;
  final String title;

  const SkillDetailPage({super.key, required this.uID, required this.title});

  @override
  State<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends State<SkillDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Специальность ${widget.title}'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            IconButton(
              icon: _isFavorite
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
              tooltip: 'Добавить в избранное',
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: Skill.getObject(widget.uID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WideTemplate(
                  head: Image.asset(
                    'assets/back-skill.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          snapshot.data!.code,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        const Divider(),
                        Table(
                          border: TableBorder.all(color: Colors.black12),
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          children: [
                            TableRow(children: [
                              const TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Специальность",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot.data!.specialty.title),
                              )),
                            ]),
                            TableRow(children: [
                              const TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Тип",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(snapshot.data!.specialty.cType ?? ""),
                              )),
                            ]),
                          ],
                        ),
                        Text(
                          'Описание',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(),
                        MarkdownBody(data: snapshot.data!.desc ?? ''),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Где можно получить специальность',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(),
                        EstablishmentViewHolderWithoutSearchBar(
                            listDispatcher:
                                Establishment.getSkillRelatedObjectsList(
                                    snapshot.data!.id)),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
