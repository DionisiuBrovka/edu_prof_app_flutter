import 'package:edu_prof_app_flutter/elements/MapEst.dart';
import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/listViews/EstablishmentListView.dart';
import 'package:edu_prof_app_flutter/viewHolders/EstablishmentViewHolder.dart';
import 'package:flutter/material.dart';

class EstablishmentListPage extends StatefulWidget {
  const EstablishmentListPage({super.key});

  @override
  State<EstablishmentListPage> createState() => _EstablishmentListPageState();
}

class _EstablishmentListPageState extends State<EstablishmentListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Учреждение образования'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          bottom: TabBar(
              labelColor: Theme.of(context).colorScheme.onPrimary,
              unselectedLabelColor: Theme.of(context).primaryColorLight,
              tabs: const [
                Tab(
                  text: 'Список',
                ),
                Tab(
                  text: 'На карте',
                )
              ]),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [EstablishmentViewHolder(), MapEst()],
        ),
        drawer: const NavBar(),
      ),
    );
  }
}
