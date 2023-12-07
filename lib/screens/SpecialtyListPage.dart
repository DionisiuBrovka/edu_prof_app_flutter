import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:flutter/material.dart';

class SpecialtyListPage extends StatefulWidget {
  const SpecialtyListPage({super.key});

  @override
  State<SpecialtyListPage> createState() => _SpecialtyListPageState();
}

class _SpecialtyListPageState extends State<SpecialtyListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Специальности'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            tabs: const [
              Tab(
                text: 'ССО',
              ),
              Tab(
                text: 'ПТО',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [Center(), Center()],
        ),
        drawer: const NavBar(),
      ),
    );
  }
}