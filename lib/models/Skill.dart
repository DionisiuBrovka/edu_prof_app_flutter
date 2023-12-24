import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Specialty.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Skill {
  int id;
  Specialty specialty;
  String code;
  String title;
  String? searchtag;
  String? desc;

  Skill(
      {required this.id,
      required this.specialty,
      required this.code,
      required this.title,
      this.searchtag,
      this.desc});

  Skill.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        specialty = Specialty.fromJson(json['specialty']),
        code = json['code'],
        title = json['title'] {
    searchtag = json['searchtag'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['specialty'] = specialty.toJson();

    data['code'] = code;
    data['title'] = title;
    data['searchtag'] = searchtag;
    data['desc'] = desc;
    return data;
  }

  static Future<List<Skill>> fetchAllFromAPI() async {
    return fetch(ApiController.getSkillURL());
  }

  static Future<List<Skill>> fetchSSOFromAPI() async {
    return fetch(ApiController.getSkillSSOURL());
  }

  static Future<List<Skill>> fetchPTOFromAPI() async {
    return fetch(ApiController.getSkillPTOURL());
  }

  static Future<List<Skill>> fetch(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<Skill> dataFetched =
          body.map((e) => Skill.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load Skill list !!!');
    }
  }
}
