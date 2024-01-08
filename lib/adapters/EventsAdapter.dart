import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/screens/EventsDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsAdapter extends StatelessWidget {
  const EventsAdapter({super.key, required this.event, this.showEst = true});

  final Events event;
  final bool showEst;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: InkWell(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
              return EventsDetailPage(
                uID: event.id,
                title: event.title!,
              );
            },
          ))
        },
        child: ListTile(
          leading: const Icon(Icons.calendar_month),
          title: Text(event.title!),
          subtitle: showEst
              ? Text(DateFormat.yMMMd('ru').format(DateTime.parse(event.eDate)))
              : Text(event.org!.title),
        ),
      ),
    );
  }
}
