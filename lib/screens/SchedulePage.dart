import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  final _content = """
# ПОЛОЖЕНИЕ
**О ПРИЕМНОЙ КОМИССИИ УЧРЕЖДЕНИЯ ОБРАЗОВАНИЯ ПО ПРИЕМУ ЛИЦ ДЛЯ ПОЛУЧЕНИЯ ПРОФЕССИОНАЛЬНО-ТЕХНИЧЕСКОГО ОБРАЗОВАНИЯ**

-----

## ГЛАВА 2
### ОРГАНИЗАЦИЯ РАБОТЫ ПРИЕМНОЙ КОМИССИИ

5. Состав приемной комиссии формируется из числа педагогических работников учреждения образования. Права и обязанности ее членов определяет руководитель, который является председателем приемной комиссии и обеспечивает выполнение требований актов законодательства, регулирующих вопросы приема в учреждения образования.
Состав приемной комиссии утверждается приказом руководителя учреждения образования **до 1 января**. Срок полномочий приемной комиссии составляет один календарный год.
Из числа наиболее опытных и квалифицированных педагогических работников назначается ответственный секретарь приемной комиссии, который обеспечивает организацию работы приемной комиссии не более трех лет подряд.
Для ведения и оформления документации из числа работников учреждения образования назначается технический секретарь.
6. Приемная комиссия в сроки приема документов и зачисления, установленные Правилами приема, работает с понедельника по субботу с **9.00 до 18.00**. Организация обеденного перерыва для лиц, работающих в приемных комиссиях, осуществляется по графику, установленному председателем приемной комиссии. Если последний день приема документов или зачисления поступающих выпадает на воскресенье, приемная комиссия работает в этот день с **9.00 до 18.00**.
Приемная комиссия размещает информацию о ходе приема документов по форме согласно приложению 1 на интернет-ресурсе учреждения образования, бумажном носителе, а при наличии возможности - на электронном терминале, расположенных в приемной комиссии учреждения образования.
Информация о ходе приема документов обновляется каждый день не реже одного раза в 3 (три) часа работы приемной комиссии (12.00, 15.00, 18.00). В последний день приема документов информирование поступающих о ходе приема документов прекращается в 15.00.
В последний день приема документов допуск поступающих в здание учреждения образования, в котором располагается приемная комиссия, завершается в 18.00. Приемная комиссия в последний день приема документов в 18.00 прекращает выдачу документов с целью их подачи на другую специальность. При этом обеспечивается прием документов от всех поступающих, находящихся в здании учреждения образования, в котором располагается приемная комиссия, после прекращения допуска.
7. Решения приемной комиссии принимаются простым большинством голосов при наличии не менее 2/3 ее состава и оформляются протоколом, который подписывается председателем и ответственным секретарем приемной комиссии.

""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('График работы комисии'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
      ),
      // ignore: prefer_const_constructors
      body: WideTemplate(
          // ignore: prefer_const_constructors
          bodyNoList: Markdown(
        data: _content,
        selectable: true,
      )),
      drawer: const NavBar(),
    );
  }
}
