import 'dart:convert';

import 'package:http/http.dart' as http;

class FAQ {
  int? id;
  String? q;
  String? a;
  bool isExpanded;

  FAQ({this.id, this.q, this.a, this.isExpanded = false});

  FAQ.fromJson(Map<String, dynamic> json) : isExpanded = false {
    id = json['id'];
    q = json['q'];
    a = json['a'];
  }

  static Future<List<FAQ>> getFAQList() async {
    final url = Uri.parse('https://eduapp.dionisiubrovka.online/api/v1/faq/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List body = json.decode(utf8.decode(response.bodyBytes));
      final List<FAQ> dataFetched = body.map((e) => FAQ.fromJson(e)).toList();

      return dataFetched;
    } else {
      throw Exception('Failed to load FAQ list');
    }
  }
}
