// ignore_for_file: prefer_collection_literals

import 'package:edu_prof_app_flutter/models/Group.dart';

class Speciality {
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

  Speciality(
      {required this.id,
      this.group,
      this.cType,
      this.sType,
      required this.code,
      required this.title,
      this.skill,
      this.prev,
      this.desc,
      this.icon});

  Speciality.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        code = json['code'],
        title = json['title'] {
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
}
