import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:flutter/material.dart';

class SkillCommonDataTableView extends StatelessWidget {
  const SkillCommonDataTableView({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black12),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Специальность",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(skill.specialty.title),
          )),
        ]),
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Тип",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(skill.specialty.cType ?? ""),
          )),
        ]),
      ],
    );
  }
}
