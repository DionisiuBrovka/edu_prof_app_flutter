import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class EstablishmentsDetailPage extends StatefulWidget {
  final int uID;
  final String title;

  const EstablishmentsDetailPage(
      {super.key, required this.uID, required this.title});

  @override
  State<EstablishmentsDetailPage> createState() =>
      _EstablishmentsDetailPageState();
}

class _EstablishmentsDetailPageState extends State<EstablishmentsDetailPage> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('УО ${widget.title}'),
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
            future: Establishment.getObject(widget.uID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WideTemplate(
                  head: Stack(
                    children: [
                      Image.asset(
                        'assets/back-est.jpg',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 850,
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1000)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(126, 0, 0, 0),
                                          blurRadius: 5,
                                          spreadRadius: 0)
                                    ]),
                                child: ClipOval(
                                  child: AspectRatio(
                                    aspectRatio: 1.1,
                                    child: Image.network(
                                      "https://eduapp.dionisiubrovka.online${snapshot.data!.icon}",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, obj, e) {
                                        return Image.asset(
                                          'assets/no-photo.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          snapshot.data!.title,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Divider(),
                        const Placeholder(
                          child: Text("Таблица параметров"),
                        ),
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
