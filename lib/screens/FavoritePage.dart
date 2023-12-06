import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Избраное'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            tabs: const [
              Tab(
                text: 'УО',
              ),
              Tab(
                text: 'Специальности',
              ),
              Tab(
                text: 'Мероприятия',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(),
            Center(),
            Center(),
          ],
        ),
        drawer: NavBar(),
      ),
    );
  }
}
