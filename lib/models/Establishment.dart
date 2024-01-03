import 'dart:convert';

import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/models/Gallery.dart';
import 'package:edu_prof_app_flutter/models/Specialty.dart';
import 'package:edu_prof_app_flutter/models/SvodTable.dart';
import 'package:edu_prof_app_flutter/screens/SkillDetailPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Establishment {
  int id;
  List<Events>? events;
  List<Gallery>? gallery;
  List<Specialty>? specialty;
  List<SvodTable>? skills;
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
  String? wface;
  String? wtwit;
  String? wtic;
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
      this.skills,
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
      this.wface,
      this.wtwit,
      this.wtic,
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
        skills = [],
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
    print("prekol 1");
    if (json['skills'] != null) {
      print("prekol 3");
      skills = <SvodTable>[];
      print("prekol 4");
      json['skills'].forEach((v) {
        skills!.add(SvodTable.fromJson(v));
      });
      print("prekol 5");
    }
    print("prekol 2");

    shortTitle = json['short_title'];
    desc = json['desc'];
    tel = json['tel'];
    mail = json['mail'];
    email = json['email'];
    wsite = json['wsite'];
    wtel = json['wtel'];
    wvk = json['wvk'];
    winsta = json['winsta'];
    wface = json['wface'];
    wtwit = json['wtwit'];
    wtic = json['wtic'];
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

  List<DataRow> getSvodTableRows(BuildContext context) {
    List<DataRow> result = [];
    if (skills != null) {
      for (var skill in skills!) {
        List<Widget> skillLinksList = [];

        for (var s in skill.skill) {
          skillLinksList.add(Container(
            height: 40,
            child: Card(
                color: Color.fromARGB(255, 194, 214, 248),
                margin: EdgeInsets.only(top: 4, bottom: 4),
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) {
                        return SkillDetailPage(
                          uID: s.id,
                          title: s.title,
                        );
                      },
                    ))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(s.specialty.getIcon()),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("${s.code} // ${s.title}"),
                      ],
                    ),
                  ),
                )),
          ));
        }

        result.add(DataRow(cells: [
          DataCell(Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: skillLinksList,
          )),
          DataCell(Text(
            "${skill.sType} классов",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            skill.bCount != null ? skill.bCount!.toString() : " --- ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            skill.pCount != null ? skill.pCount!.toString() : " --- ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            skill.bAvd != null ? skill.bAvd!.toString() : " --- ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            skill.pAvd != null ? skill.pAvd!.toString() : " --- ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(skill.isOpfr ? "Да \n(${skill.opfrQnic!}) " : "Нет")),
          DataCell(Text("${skill.rule}")),
        ]));
      }
      return result;
    } else {
      return [];
    }
  }

  int getSvodTableRowsHeightModificator() {
    int result = 0;
    if (skills != null) {
      for (var skill in skills!) {
        for (var s in skill.skill) {
          result += 1;
        }
      }
      return result;
    } else {
      return 0;
    }
  }

  static Future<List<Establishment>> getAllObjectsList() async {
    return fetchList(ApiController.getAPIUri('establishment/'));
  }

  static Future<List<Establishment>> getSkillRelatedObjectsList(int pk) async {
    return fetchList(ApiController.getAPIUri('skill/$pk/est/'));
  }

  static Future<Establishment> getObject(int pk) async {
    return fetchInstance(ApiController.getAPIUri('establishment/$pk/'));
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
