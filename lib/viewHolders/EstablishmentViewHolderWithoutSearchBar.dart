import 'package:edu_prof_app_flutter/adapters/EstablishmentAdapter.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentViewHolderWithoutSearchBar extends StatelessWidget {
  final Future<List<Establishment>> listDispatcher;

  const EstablishmentViewHolderWithoutSearchBar(
      {super.key, required this.listDispatcher});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: listDispatcher,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data!
                  .map((item) => EstablishmentAdapter(establishment: item))
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
