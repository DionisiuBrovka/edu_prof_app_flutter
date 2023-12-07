import 'package:edu_prof_app_flutter/adapters/EstablishmentAdapter.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentViewHolder extends StatelessWidget {
  const EstablishmentViewHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Establishment.fetchFromAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  child: Card(
                    color: Theme.of(context).primaryColorDark,
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: Colors.white,
                        textDirection: null,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).primaryColorLight),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: snapshot.data!
                        .map((e) => EstablishmentAdapter(establishment: e))
                        .toList(),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
