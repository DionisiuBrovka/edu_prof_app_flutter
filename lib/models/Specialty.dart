// ignore_for_file: prefer_collection_literals, unused_import

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

  IconData getIcon() {
    if (icon != null) {
      var value = int.tryParse(icon!, radix: 16);
      print(value);
      if (value == null) {
        return const IconData(0xf501,
            fontFamily: 'FontAwesomeSolid',
            fontPackage: 'font_awesome_flutter');
      } else {
        return IconData(value,
            fontFamily: 'FontAwesomeSolid',
            fontPackage: 'font_awesome_flutter');
      }
    } else {
      return const IconData(0xf508,
          fontFamily: 'FontAwesomeSolid', fontPackage: 'font_awesome_flutter');
    }
  }
}
