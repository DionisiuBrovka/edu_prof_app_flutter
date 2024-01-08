import 'package:edu_prof_app_flutter/adapters/EventsAdapter.dart';
import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:flutter/material.dart';

class EventsViewHolder extends StatelessWidget {
  final Future<List<Events>> listDispatcher;

  const EventsViewHolder({super.key, required this.listDispatcher});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: listDispatcher,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return Column(
                children: snapshot.data!
                    .map((item) => EventsAdapter(event: item))
                    .toList(),
              );
            } else {
              return const Center(
                  child: Text(
                'Пока ничего не ожидается ...',
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class EventsViewHolderWithoutListDispatcher extends StatelessWidget {
  final List<Events> events;

  const EventsViewHolderWithoutListDispatcher(
      {super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events
          .map((item) => EventsAdapter(
                event: item,
                showEst: false,
              ))
          .toList(),
    );
  }
}
