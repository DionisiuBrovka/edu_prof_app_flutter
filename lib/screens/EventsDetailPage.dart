import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsDetailPage extends StatefulWidget {
  final int uID;
  final String title;

  const EventsDetailPage({super.key, required this.uID, required this.title});

  @override
  State<EventsDetailPage> createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Мероприятие "${widget.title}"'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            // IconButton(
            //   icon: _isFavorite
            //       ? const Icon(Icons.star)
            //       : const Icon(Icons.star_border),
            //   tooltip: 'Добавить в избранное',
            //   onPressed: () {
            //     setState(() {
            //       _isFavorite = !_isFavorite;
            //     });
            //   },
            // ),
          ],
        ),
        body: FutureBuilder(
            future: Events.getObject(widget.uID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WideTemplate(
                  head: Image.asset(
                    'assets/ef.jpg',
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
                          snapshot.data!.title!,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          DateFormat.yMMMd('ru')
                              .format(DateTime.parse(snapshot.data!.eDate)),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        Divider(),
                        MarkdownBody(data: snapshot.data!.desc!),
                        SizedBox(
                          height: 20,
                        ),
                        snapshot.data!.eUrl != null
                            ? FilledButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(snapshot.data!.eUrl!));
                                },
                                child: Text("Подробнее"))
                            : Center()
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
