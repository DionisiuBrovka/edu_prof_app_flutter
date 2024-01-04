import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:edu_prof_app_flutter/screens/SkillDetailPage.dart';
import 'package:flutter/material.dart';

class SkillAdapter extends StatefulWidget {
  const SkillAdapter({super.key, required this.skill});

  final Skill skill;

  @override
  State<SkillAdapter> createState() => _SkillAdapterState();
}

class _SkillAdapterState extends State<SkillAdapter> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: InkWell(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
              return SkillDetailPage(
                uID: widget.skill.id,
                title: widget.skill.title,
              );
            },
          ))
        },
        child: ListTile(
          leading: Icon(widget.skill.specialty.getIcon()),
          title: Text(widget.skill.title),
          subtitle: Text(widget.skill.specialty.title),
        ),
      ),
    );
  }
}
