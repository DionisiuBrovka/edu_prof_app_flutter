import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Events {
  int? id;
  String? eDate;
  String? title;

  Events({this.id, this.eDate, this.title});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eDate = json['e_date'];
    title = json['title'];
  }

  static Future<List<Events>> getAllObjectsList() async {
    return fetchList(ApiController.getAPIUri('event/'));
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
}
