import 'package:flutter/material.dart';

class SkillDetailPage extends StatefulWidget {
  final int uID;
  final String title;

  const SkillDetailPage({super.key, required this.uID, required this.title});

  @override
  State<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends State<SkillDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Специальность ${widget.title}'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
        ),
        body: Center(
          child: Text(widget.uID.toString()),
        ));
  }
}
