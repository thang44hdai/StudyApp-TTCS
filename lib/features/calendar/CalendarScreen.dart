import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event.dart';

var event_controller = TextEditingController();

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

// Lưu lịch sử
// Join đề
// Quét QR phòng thi
// Bảng xếp hạng
// Tạo QR phòng thi

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Schedule',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Event Name:"),
                  content: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: event_controller,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Submit"),
                    ),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: CalendarBody(),
    );
  }
}

class CalendarBody extends StatefulWidget {
  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  DateTime _forcusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _forcusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _forcusedDay = day;
      _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    });
  }

  late final ValueNotifier<List<Event>> _selectedEvents;

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            focusedDay: _forcusedDay,
            firstDay: DateTime.utc(2024),
            lastDay: DateTime.utc(2025),
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            selectedDayPredicate: (day) => isSameDay(day, _forcusedDay),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red[200],
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 0.5,
          color: Colors.grey,
        ),
        SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: _selectedEvents,
          builder: (context, value, _) {
            return ListView.builder(itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  onTap: () {
                    events.addAll({
                      _selectedDay!: [Event(title: event_controller.text)]
                    });
                    Navigator.pop(context);
                    _selectedEvents.value = _getEventsForDay(_selectedDay!);
                  },
                ),
              );
            });
          },
        )
      ],
    );
  }
}
