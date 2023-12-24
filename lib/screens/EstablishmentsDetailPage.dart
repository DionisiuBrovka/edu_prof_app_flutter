import 'package:flutter/material.dart';

class EstablishmentsDetailPage extends StatefulWidget {
  final int uID;
  final String title;

  const EstablishmentsDetailPage(
      {super.key, required this.uID, required this.title});

  @override
  State<EstablishmentsDetailPage> createState() =>
      _EstablishmentsDetailPageState();
}

class _EstablishmentsDetailPageState extends State<EstablishmentsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('УО ${widget.title}'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
        ),
        body: Center(
          child: Text(widget.uID.toString()),
        ));
  }
}
