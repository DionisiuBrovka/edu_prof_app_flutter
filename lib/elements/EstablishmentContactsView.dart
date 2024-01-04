import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EstablishmentContactsView extends StatelessWidget {
  const EstablishmentContactsView({super.key, required this.establishment});

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
