import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/models/Skill.dart';
import 'package:edu_prof_app_flutter/viewHolders/SkillViewHolder.dart';
import 'package:flutter/material.dart';

class SkillListPage extends StatefulWidget {
  const SkillListPage({super.key});

  @override
  State<SkillListPage> createState() => _SkillListPageState();
}

class _SkillListPageState extends State<SkillListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Специальности'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(
                text: 'Все',
              ),
              Tab(
                text: 'ССО',
              ),
              Tab(
                text: 'ПТО',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SkillViewHolder(
              listDispatcher: Skill.getAllObjectsList(),
            ),
            SkillViewHolder(
              listDispatcher: Skill.getSSOObjectsList(),
            ),
            SkillViewHolder(
              listDispatcher: Skill.getPTOObjectsList(),
            ),
          ],
        ),
        drawer: const NavBar(),
      ),
    );
  }
}
