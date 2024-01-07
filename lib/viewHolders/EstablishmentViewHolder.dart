import 'package:edu_prof_app_flutter/adapters/EstablishmentAdapter.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/templates/CustomSearchBar.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';

class EstablishmentViewHolder extends StatefulWidget {
  final Future<List<Establishment>> listDispatcher;

  const EstablishmentViewHolder({super.key, required this.listDispatcher});

  @override
  State<EstablishmentViewHolder> createState() =>
      _EstablishmentViewHolderState();
}

class _EstablishmentViewHolderState extends State<EstablishmentViewHolder> {
  late Future<List<Establishment>> _filteredEstablishments;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredEstablishments = widget.listDispatcher;
    _searchController = TextEditingController();
  }

  void _performSearch(String query) {
    setState(() {
      _filteredEstablishments = widget.listDispatcher.then((ests) {
        return ests.where((est) => "${est.title} ${est.shortTitle}"
            .toLowerCase()
            .contains(query.toLowerCase()));
      }).then((filteredSkills) => filteredSkills.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WideTemplate(
      headFixed: CustomSearchBar(
        controller: _searchController,
        onTextChanged: _performSearch,
      ),
      body: FutureBuilder(
        future: _filteredEstablishments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Что то пошло не так ...'));
          } else if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.isNotEmpty
                  ? snapshot.data!
                      .map((item) => EstablishmentAdapter(
                            establishment: item,
                          ))
                      .toList()
                  : const [
                      Center(
                          child: Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.black38,
                        size: 40,
                      )),
                      Center(
                          child: Text(
                        "По вашему запросу \nничего не нашлось ...",
                        style: TextStyle(color: Colors.black38, fontSize: 22),
                      )),
                    ],
            );
          } else {
            return const Center(child: Text('Что то пошло не так ...'));
          }
        },
      ),
    );
  }
}
