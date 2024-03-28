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
  DateTime today = DateTime.now();
  Map<DateTime, List<Event>> events = {};

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
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
            focusedDay: today,
            firstDay: DateTime.utc(2024),
            lastDay: DateTime.utc(2025),
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
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
      ],
    );
  }
}
