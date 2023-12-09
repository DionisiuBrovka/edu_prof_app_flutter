// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Group.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Specialty {
  int id;
  Group? group;
  String? cType;
  String? sType;
  String code;
  String title;
  String? skill;
  String? prev;
  String? desc;
  String? icon;
  bool isFavorite;

  Specialty(
      {required this.id,
      this.group,
      this.cType,
      this.sType,
      required this.code,
      required this.title,
      this.skill,
      this.prev,
      this.desc,
      this.icon,
      this.isFavorite = false});

  Specialty.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        code = json['code'],
        title = json['title'],
        isFavorite = false {
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    cType = json['c_type'];
    sType = json['s_type'];

    skill = json['skill'];
    prev = json['prev'];
    desc = json['desc'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    data['c_type'] = cType;
    data['s_type'] = sType;
    data['code'] = code;
    data['title'] = title;
    data['skill'] = skill;
    data['prev'] = prev;
    data['desc'] = desc;
    data['icon'] = icon;
    return data;
  }

  static Future<List<Specialty>> fetchAllFromAPI() async {
    return fetch(ApiController.getSpecialtyURL());
  }

  static Future<List<Specialty>> fetchSSOFromAPI() async {
    return fetch(ApiController.getSpecialtySSOURL());
  }

  static Future<List<Specialty>> fetchPTOFromAPI() async {
    return fetch(ApiController.getSpecialtyPTOURL());
  }

  static Future<List<Specialty>> fetch(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<Specialty> dataFetched =
          body.map((e) => Specialty.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load Specialty list !!!');
    }
  }

  IconData getIcon() {
    if (icon != null) {
      var value = int.tryParse(icon!);
      if (value == null) {
        return const IconData(0xf01ac, fontFamily: 'MaterialIcons');
      } else {
        return IconData(value, fontFamily: 'MaterialIcons');
      }
    } else {
      return const IconData(0xf01ac, fontFamily: 'MaterialIcons');
    }
  }
}
