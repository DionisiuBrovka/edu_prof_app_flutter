import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Events {
  int id;
  String eDate;
  String? title;
  String? desc;
  String? prev;
  String? eUrl;
  Establishment? org;

  Events(
      {required this.id,
      required this.eDate,
      this.title,
      this.desc,
      this.prev,
      this.eUrl,
      this.org});

  Events.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        eDate = json['e_date'] {
    title = json['title'];
    desc = json['desc'];
    prev = json['prev'];
    eUrl = json['e_url'];
    org = Establishment.fromJson(json['org']);
  }

  static Future<List<Events>> getAllObjectsList() async {
    return fetchList(ApiController.getAPIUri('event/'));
  }

  static Future<List<Events>> getObjectsForEstablishmentList(int pk) async {
    return fetchList(ApiController.getAPIUri('event/est/$pk'));
  }

  static Future<Events> getObject(int pk) async {
    return fetchInstance(ApiController.getAPIUri('event/$pk/'));
  }

  static Future<List<Events>> fetchList(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<Events> dataFetched =
          body.map((e) => Events.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load Establishments list !!!');
    }
  }

  static Future<Events> fetchInstance(Uri uriForFetch) async {
    final response = await http.get(uriForFetch);
    print(uriForFetch);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final body = json.decode(utf8.decode(response.bodyBytes));
      final Events dataFetched = Events.fromJson(body);

      return dataFetched;
    } else {
      throw Exception('Failed to load Establisment !!!');
    }
  }
}
