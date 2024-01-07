import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/models/Event.dart';
import 'package:edu_prof_app_flutter/templates/WideTemplate.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsListPage extends StatefulWidget {
  const EventsListPage({super.key});

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мероприятия'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
      ),
      body: FutureBuilder(
          future: Events.getAllObjectsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Что то пошло не так ...'));
            } else if (snapshot.hasData) {
              return WideTemplate(
                headFixed: CalendarView(
                  events: snapshot.data!,
                ),
              );
            } else {
              return const Center(child: Text('Что то пошло не так ...'));
            }
          }),
      drawer: const NavBar(),
    );
  }
}

class CalendarView extends StatefulWidget {
  final List<Events> events;
  const CalendarView({super.key, required this.events});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime? _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru',
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      startingDayOfWeek: StartingDayOfWeek.monday,
      eventLoader: _getEventsForDay,
      onDaySelected: _onDateSelect,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
    );
  }

  List<Events> _getEventsForDay(DateTime day) {
    final List<Events> _list = widget.events
        .where((element) => isSameDay(DateTime.parse(element.eDate!), day))
        .toList();

    return _list;
  }

  void _onDateSelect(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (isSameDay(selectedDay, _selectedDay)) {
        _selectedDay = null;
      } else {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      }
    });
  }
}
