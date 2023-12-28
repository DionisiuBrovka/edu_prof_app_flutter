import 'package:edu_prof_app_flutter/adapters/SkillAdapter.dart';
import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:edu_prof_app_flutter/templates/CustomSearchBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class SkillViewHolder extends StatelessWidget {
  const SkillViewHolder({super.key, required this.listDispatcher});

  final Future<List<Skill>> listDispatcher;

  @override
  Widget build(BuildContext context) {
    return WideTemplate(
      headFixed: const CustomSearchBar(),
      body: FutureBuilder(
          future: listDispatcher,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!
                    .map((item) => SkillAdapter(
                          skill: item,
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
