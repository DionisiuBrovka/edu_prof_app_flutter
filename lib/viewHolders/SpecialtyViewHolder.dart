import 'package:edu_prof_app_flutter/adapters/SpecialtyAdapter.dart';
import 'package:edu_prof_app_flutter/models/Specialty.dart';
import 'package:flutter/material.dart';

class SpecialtyViewHolder extends StatelessWidget {
  const SpecialtyViewHolder({super.key, required this.listDispatcher});

  final Future<List<Specialty>> Function() listDispatcher;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Theme.of(context).primaryColor,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.white,
              textDirection: null,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColorLight),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(99, 255, 255, 255)),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
        ),
        FutureBuilder(
            future: listDispatcher(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: snapshot.data!
                              .map((e) => SpecialtyAdapter(
                                    specialty: e,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}
