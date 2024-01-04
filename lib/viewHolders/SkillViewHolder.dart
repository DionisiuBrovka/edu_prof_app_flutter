import 'package:edu_prof_app_flutter/adapters/SkillAdapter.dart';
import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:edu_prof_app_flutter/templates/CustomSearchBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class SkillViewHolder extends StatefulWidget {
  const SkillViewHolder({super.key, required this.listDispatcher});

  final Future<List<Skill>> listDispatcher;

  @override
  State<SkillViewHolder> createState() => _SkillViewHolderState();
}

class _SkillViewHolderState extends State<SkillViewHolder> {
  late Future<List<Skill>> _filteredSkills;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredSkills = widget.listDispatcher;
    _searchController = TextEditingController();
  }

  void _performSearch(String query) {
    setState(() {
      _filteredSkills = widget.listDispatcher.then((skills) {
        return skills.where((skill) => "${skill.title} ${skill.searchtag}"
            .toLowerCase()
            .contains(query.toLowerCase()));
      }).then((filteredSkills) => filteredSkills.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WideTemplate(
      headFixed: CustomSearchBar(
        controller: _searchController,
        onTextChanged: _performSearch,
      ),
      body: FutureBuilder(
        future: _filteredSkills,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Что то пошло не так ...'));
          } else if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.isNotEmpty
                  ? snapshot.data!
                      .map((item) => SkillAdapter(
                            skill: item,
                          ))
                      .toList()
                  : const [
                      Center(
                          child: Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.black38,
                        size: 40,
                      )),
                      Center(
                          child: Text(
                        "По вашему запросу \nничего не нашлось ...",
                        style: TextStyle(color: Colors.black38, fontSize: 22),
                      )),
                    ],
            );
          } else {
            return const Center(child: Text('Что то пошло не так ...'));
          }
        },
      ),
    );
  }
}
