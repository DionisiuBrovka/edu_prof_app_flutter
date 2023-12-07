import 'dart:convert';

import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/models/Gallery.dart';
import 'package:edu_prof_app_flutter/models/Speciality.dart';

import 'package:http/http.dart' as http;

class Establishment {
  int id;
  List<Events>? events;
  List<Gallery>? gallery;
  List<Speciality>? specialty;
  String title;
  String? shortTitle;
  String? desc;
  String adress;
  String? tel;
  String? mail;
  String? email;
  String? wsite;
  String? wtel;
  String? wvk;
  String? winsta;
  String? wother;
  String? icon;
  String? prev;
  String? promoMedio;
  String? coords;
  bool isFavorite;

  Establishment(
      {required this.id,
      this.events,
      this.gallery,
      this.specialty,
      required this.title,
      this.shortTitle,
      this.desc,
      required this.adress,
      this.tel,
      this.mail,
      this.email,
      this.wsite,
      this.wtel,
      this.wvk,
      this.winsta,
      this.wother,
      required this.icon,
      this.prev,
      this.promoMedio,
      this.coords,
      this.isFavorite = false});

  Establishment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        adress = json['adress'],
        icon = json['icon'],
        isFavorite = false {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    if (json['specialty'] != null) {
      specialty = <Speciality>[];
      json['specialty'].forEach((v) {
        specialty!.add(Speciality.fromJson(v));
      });
    }

    shortTitle = json['short_title'];
    desc = json['desc'];
    tel = json['tel'];
    mail = json['mail'];
    email = json['email'];
    wsite = json['wsite'];
    wtel = json['wtel'];
    wvk = json['wvk'];
    winsta = json['winsta'];
    wother = json['wother'];
    prev = json['prev'];
    promoMedio = json['promo_medio'];
    coords = json['coords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    if (specialty != null) {
      data['specialty'] = specialty!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['short_title'] = shortTitle;
    data['desc'] = desc;
    data['adress'] = adress;
    data['tel'] = tel;
    data['mail'] = mail;
    data['email'] = email;
    data['wsite'] = wsite;
    data['wtel'] = wtel;
    data['wvk'] = wvk;
    data['winsta'] = winsta;
    data['wother'] = wother;
    data['icon'] = icon;
    data['prev'] = prev;
    data['promo_medio'] = promoMedio;
    data['coords'] = coords;
    return data;
  }

  static Future<List<Establishment>> fetchFromAPI() async {
    final url =
        Uri.parse('https://eduapp.dionisiubrovka.online/api/v1/establishment/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<Establishment> dataFetched =
          body.map((e) => Establishment.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load FAQ list');
    }
  }
}
