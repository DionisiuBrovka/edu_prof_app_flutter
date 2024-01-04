import 'package:edu_prof_app_flutter/models/Specialty.dart';
import 'package:flutter/material.dart';

class SpecialtyAdapter extends StatefulWidget {
  const SpecialtyAdapter({super.key, required this.specialty});

  final Specialty specialty;

  @override
  State<SpecialtyAdapter> createState() => _SpecialtyAdapterState();
}

class _SpecialtyAdapterState extends State<SpecialtyAdapter> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: Icon(widget.specialty.getIcon()),
        title: Text(widget.specialty.title),
        subtitle: Text(widget.specialty.code),
      ),
    );
  }
}
