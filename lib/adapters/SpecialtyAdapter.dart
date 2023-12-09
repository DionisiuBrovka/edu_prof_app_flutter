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
    // ignore: prefer_const_constructors
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: Icon(widget.specialty.getIcon()),
        title: Text(widget.specialty.title),
        subtitle: Text(widget.specialty.code),
        // trailing: IconButton(
        //   icon: widget.specialty.isFavorite
        //       ? const Icon(Icons.star_rate)
        //       : const Icon(Icons.star_border),
        //   onPressed: () {
        //     setState(() {
        //       widget.specialty.isFavorite = !widget.specialty.isFavorite;
        //     });
        //   },
        // ),
      ),
    );
  }
}
