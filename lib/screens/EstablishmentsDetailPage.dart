import 'package:carousel_slider/carousel_slider.dart';
import 'package:edu_prof_app_flutter/elements/EstablishmentsSkillTable.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          snapshot.data!.title,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Divider(),
                        snapshot.data!.gallery!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: EstablishmentGalleryWidget(
                                    establishment: snapshot.data!),
                              )
                            : const Center(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EstablishmentParamWidget(
                            establishment: snapshot.data!,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "План набора на 2024/2023 год",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(),
                        EstablishmentsSkillTable(
                          establishment: snapshot.data!,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Контакты",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(),
                        EstablishmentContactsWidget(
                          establishment: snapshot.data!,
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

class EstablishmentContactsWidget extends StatelessWidget {
  const EstablishmentContactsWidget({super.key, required this.establishment});

  final Establishment establishment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        establishment.tel != null
            ? ContactCardWidget(
                icon: Icons.phone,
                title: "Телефон",
                uri: Uri.parse(
                  "tel:${establishment.tel!}",
                ))
            : const Center(),
        establishment.email != null
            ? ContactCardWidget(
                icon: Icons.email,
                title: "Электронная почта",
                uri: Uri.parse(
                  "mailto:${establishment.email!}",
                ))
            : const Center(),
        establishment.wsite != null
            ? ContactCardWidget(
                icon: Icons.north_east,
                title: "Веб-сайт",
                uri: Uri.parse(
                  establishment.wsite!,
                ))
            : const Center(),
        establishment.wtel != null
            ? ContactCardWidget(
                icon: Icons.telegram_outlined,
                title: "Телеграмм",
                uri: Uri.parse(
                  establishment.wtel!,
                ))
            : const Center(),
        establishment.wvk != null
            ? ContactCardWidget(
                icon: FontAwesomeIcons.vk,
                title: "Вконтакте",
                uri: Uri.parse(
                  establishment.wvk!,
                ))
            : const Center(),
        establishment.winsta != null
            ? ContactCardWidget(
                icon: FontAwesomeIcons.instagram,
                title: "Инстаграм",
                uri: Uri.parse(
                  establishment.winsta!,
                ))
            : const Center(),
        establishment.wface != null
            ? ContactCardWidget(
                icon: FontAwesomeIcons.facebook,
                title: "Фейсбук",
                uri: Uri.parse(
                  establishment.wface!,
                ))
            : const Center(),
        establishment.wtwit != null
            ? ContactCardWidget(
                icon: FontAwesomeIcons.xTwitter,
                title: "Твиттер",
                uri: Uri.parse(
                  establishment.wtwit!,
                ))
            : const Center(),
        establishment.wtic != null
            ? ContactCardWidget(
                icon: FontAwesomeIcons.tiktok,
                title: "Тик-ток",
                uri: Uri.parse(
                  establishment.wtic!,
                ))
            : const Center(),
        establishment.wother != null
            ? ContactCardWidget(
                icon: Icons.more_horiz,
                title: "Другое",
                uri: Uri.parse(
                  establishment.wother!,
                ))
            : const Center(),
      ],
    );
  }
}

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.uri,
  });

  final IconData icon;
  final String title;
  final Uri uri;

  void onPhoneTap() {
    launchUrl(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          launchUrl(uri);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                )
              ],
            )),
      ),
    );
  }
}

class EstablishmentGalleryWidget extends StatelessWidget {
  const EstablishmentGalleryWidget({super.key, required this.establishment});

  final Establishment establishment;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        // ignore: prefer_null_aware_operators
        items: establishment.gallery!
            .map((e) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(165, 0, 0, 0),
                        blurRadius: 6,
                        spreadRadius: 1)
                  ]),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(
                        "https://eduapp.dionisiubrovka.online/${e.photo}",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.desc ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 4 / 3,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}

class EstablishmentParamWidget extends StatelessWidget {
  const EstablishmentParamWidget({super.key, required this.establishment});

  final Establishment establishment;

  @override
  Widget build(BuildContext context) {
    return Table(
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
              "Адрес УО",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.adress),
          )),
        ]),
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Контактный номер телефона",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.tel ?? ""),
          )),
        ]),
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Электронная почта",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.email ?? ""),
          )),
        ]),
      ],
    );
  }
}
