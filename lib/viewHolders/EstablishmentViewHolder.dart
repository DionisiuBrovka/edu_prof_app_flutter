import 'package:edu_prof_app_flutter/adapters/EstablishmentAdapter.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/templates/CustomSearchBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class EstablishmentViewHolder extends StatelessWidget {
  const EstablishmentViewHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return WideTemplate(
        headFixed: const CustomSearchBar(),
        body: Column(
          children: [
            FutureBuilder(
                future: Establishment.fetchFromAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!
                          .map((e) => EstablishmentAdapter(establishment: e))
                          .toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ));
  }
}
