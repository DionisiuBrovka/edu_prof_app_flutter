import 'package:edu_prof_app_flutter/adapters/SpecialtyAdapter.dart';
import 'package:edu_prof_app_flutter/models/Specialty.dart';
import 'package:edu_prof_app_flutter/templates/CustomSearchBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class SpecialtyViewHolder extends StatelessWidget {
  const SpecialtyViewHolder({super.key, required this.listDispatcher});

  final Future<List<Specialty>> Function() listDispatcher;

  @override
  Widget build(BuildContext context) {
    return WideTemplate(
      headFixed: const CustomSearchBar(),
      body: FutureBuilder(
          future: listDispatcher(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!
                    .map((e) => SpecialtyAdapter(
                          specialty: e,
                        ))
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
