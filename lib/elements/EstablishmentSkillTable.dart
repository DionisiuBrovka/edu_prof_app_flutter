import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentSkillTable extends StatefulWidget {
  const EstablishmentSkillTable({super.key, required this.establishment});

  final Establishment establishment;

  @override
  State<EstablishmentSkillTable> createState() =>
      _EstablishmentsSkillTableState();
}

class _EstablishmentsSkillTableState extends State<EstablishmentSkillTable> {
  int _lenght = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _lenght = widget.establishment.getSvodTableRowsHeightModificator();
      print(_lenght);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + (_lenght * 40),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor),
              headingTextStyle: const TextStyle(color: Colors.white),
              dataRowMinHeight: 20,
              dataRowMaxHeight: double.infinity,
              headingRowHeight: 60,
              horizontalMargin: 0,
              columns: const [
                DataColumn(
                    label: Text(
                        "Код специальности \nНаименование профиля образования, \nспециальности, квалификации")),
                DataColumn(label: Text("На базе ...")),
                DataColumn(label: Text("Набор бюджет")),
                DataColumn(label: Text("Набор платное")),
                DataColumn(label: Text("Проходной балл бюджет \nв 2023 году")),
                DataColumn(label: Text("Проходной балл платное \nв 2023 году")),
                DataColumn(label: Text("Набор диц с ОПФР")),
                DataColumn(label: Text("Зачисление")),
              ],
              rows: widget.establishment.getSvodTableRows(context))
        ],
      ),
    );
  }
}
