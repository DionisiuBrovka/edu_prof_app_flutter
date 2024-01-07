import 'package:edu_prof_app_flutter/elements/EstablishmentsListMapView.dart';
import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
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
              tabAlignment: TabAlignment.center,
              tabs: const [
                Tab(
                  text: 'Список',
                ),
                Tab(
                  text: 'На карте',
                )
              ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            WideTemplate(
                ebanuilist: false,
                body: EstablishmentViewHolder(
                  listDispatcher: Establishment.getAllObjectsList(),
                )),
            const EstablishmentsListMapView()
          ],
        ),
        drawer: const NavBar(),
      ),
    );
  }
}
