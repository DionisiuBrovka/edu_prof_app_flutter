import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentCommonDataTableView extends StatelessWidget {
  const EstablishmentCommonDataTableView(
      {super.key, required this.establishment});

  final Establishment establishment;

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
              "Адрес УО",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.adress),
          )),
        ]),
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Контактный номер телефона",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.tel ?? ""),
          )),
        ]),
        TableRow(children: [
          const TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Электронная почта",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(establishment.email ?? ""),
          )),
        ]),
      ],
    );
  }
}
