import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/mascot.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.5, -2)),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: Center(
                        child: Card(
                          child: Text(''),
                        ),
                      ),
                    )),
                FilledButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.star_outlined),
                    label: const Text('Избраное')),
                FilledButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.account_balance),
                    label: const Text('Учреждения образования')),
              ],
            ),
          ),
        ],
      ),
      drawer: const NavBar(),
    );
  }
}
