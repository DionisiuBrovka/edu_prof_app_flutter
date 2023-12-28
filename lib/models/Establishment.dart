import 'dart:convert';

import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/models/Gallery.dart';
import 'package:edu_prof_app_flutter/models/Specialty.dart';

import 'package:http/http.dart' as http;

class Establishment {
  int id;
  List<Events>? events;
  List<Gallery>? gallery;
  List<Specialty>? specialty;
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
  double? latitude;
  double? longitude;
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
      this.isFavorite = false,
      this.latitude,
      this.longitude});

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
      specialty = <Specialty>[];
      json['specialty'].forEach((v) {
        specialty!.add(Specialty.fromJson(v));
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

    updateCoords(json['coords']);
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

  void updateCoords(String? argCoords) {
    print(argCoords);
    if (argCoords != null) {
      var t = argCoords.split(', ');
      latitude = double.parse(t[0]);
      longitude = double.parse(t[1]);
    }
  }

  static Future<List<Establishment>> getAllObjectsList() async {
    return fetchList(ApiController.getAPIUri('establishment/'));
  }

  static Future<List<Establishment>> getSkillRelatedObjectsList(int pk) async {
    return fetchList(ApiController.getAPIUri('skill/$pk/est/'));
  }

  static Future<List<Establishment>> fetchList(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<Establishment> dataFetched =
          body.map((e) => Establishment.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load Skill list !!!');
    }
  }

  static Future<Establishment> fetchInstance(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final body = json.decode(utf8.decode(response.bodyBytes));
      final Establishment dataFetched = Establishment.fromJson(body);

      return dataFetched;
    } else {
      throw Exception('Failed to load Skill !!!');
    }
  }
}
