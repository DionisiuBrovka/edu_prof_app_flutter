import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentListView extends StatefulWidget {
  const EstablishmentListView({super.key});

  @override
  State<EstablishmentListView> createState() => _EstablishmentListViewState();
}

class _EstablishmentListViewState extends State<EstablishmentListView> {
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
                        .map((e) => EstablismentCard(e: e))
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

class EstablismentCard extends StatefulWidget {
  const EstablismentCard({super.key, required this.e});

  final Establishment e;

  @override
  State<EstablismentCard> createState() => _EstablismentCardState();
}

class _EstablismentCardState extends State<EstablismentCard> {
  // bool fov = widget.e.isFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: ClipOval(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              "https://eduapp.dionisiubrovka.online/${widget.e.icon}",
              fit: BoxFit.cover,
              errorBuilder: (context, obj, e) {
                return Image.asset(
                  'assets/header-back.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        title: Text(widget.e.title),
        subtitle: Text(widget.e.adress),
        subtitleTextStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: const Color.fromARGB(255, 120, 120, 120)),
        trailing: IconButton(
          icon: widget.e.isFavorite
              ? const Icon(Icons.star_rate)
              : const Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              widget.e.isFavorite = !widget.e.isFavorite;
            });
          },
        ),
      ),
    );
  }
}
