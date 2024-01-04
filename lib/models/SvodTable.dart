import 'package:edu_prof_app_flutter/models/Skill.dart';

class SvodTable {
  int id;
  List<Skill> skill;
  String sType;
  int? bCount;
  String? bLong;
  double? bAvd;
  int? pCount;
  String? pLong;
  double? pAvd;
  String? rule;
  bool isOpfr;
  String? opfrQnic;
  int? est;

  SvodTable(
      {required this.id,
      required this.skill,
      required this.sType,
      this.bCount,
      this.bLong,
      this.bAvd,
      this.pCount,
      this.pLong,
      this.pAvd,
      this.rule,
      required this.isOpfr,
      this.opfrQnic,
      this.est});

  SvodTable.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        skill = [],
        sType = json['s_type'],
        isOpfr = json['is_opfr'] {
    if (json['skill'] != null) {
      skill = <Skill>[];
      json['skill'].forEach((v) {
        skill.add(Skill.fromJson(v));
      });
    }
    bCount = json['b_count'];
    bLong = json['b_long'];
    bAvd = json['b_avd'];
    pCount = json['p_count'];
    pLong = json['p_long'];
    pAvd = json['p_avd'];
    rule = json['rule'];
    opfrQnic = json['opfr_qnic'];
    est = json['est'];
  }
}
