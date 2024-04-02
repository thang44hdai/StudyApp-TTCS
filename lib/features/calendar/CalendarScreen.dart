import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/calendar/event.dart';
import 'package:table_calendar/table_calendar.dart';

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
  late Map<String, List<Event>> selectedEvents;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  TextEditingController _timeEventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    getEvent();
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[convertDatetimeToDate(date)] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(2023),
            lastDay: DateTime(2025),
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.red[200],
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.green),
            ),
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: true,
                leftChevronIcon: Icon(
                  Icons.navigate_before,
                  color: Colors.red,
                ),
                rightChevronIcon: Icon(
                  Icons.navigate_next,
                  color: Colors.red,
                )),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    event.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: event.time != ""
                      ? Text(event.time, style: TextStyle(color: Colors.white))
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: Column(
              children: [
                TextFormField(
                  controller: _eventController,
                ),
                TextFormField(
                  controller: _timeEventController,
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  addEvent();
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }

  void addEvent() async {
    Event event1 = Event(
        title: _eventController.text,
        time: _timeEventController.text,
        date: convertDatetimeToDate(selectedDay));

    if (_eventController.text.isEmpty) {
    } else {
      if (selectedEvents[event1.date] != null) {
        selectedEvents[event1.date]?.add(event1);
      } else {
        selectedEvents[event1.date] = [event1];
      }
    }
    Navigator.pop(context);
    setState(() {});

    // add firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var user = Constants.user;

    DocumentSnapshot documentSnapshot = await firestore
        .collection("events")
        .doc(user.account + user.password)
        .get();
    final doc = documentSnapshot.get('doc') as List<dynamic>;
    final _doc = doc.cast<Map<String, dynamic>>().toList();
    Map<String, String> event = {
      "title": event1.title,
      "date": event1.date,
      "time": event1.time,
    };
    _doc.add(event);

    await firestore
        .collection("events")
        .doc(user.account + user.password)
        .set({"doc": _doc});

    _eventController.clear();
    _timeEventController.clear();
  }

  Future<void> getEvent() async {
    var user = Constants.user;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot = await firestore
        .collection("events")
        .doc(user.account + user.password)
        .get();
    List<dynamic> eventsData = documentSnapshot.get("doc");
    List<Event> events = eventsData.map((eventData) {
      return Event(
        title: eventData['title'],
        time: eventData['time'],
        date: eventData['date'],
      );
    }).toList();

    events.forEach((element) {
      if (selectedEvents[element.date] != null) {
        selectedEvents[element.date]?.add(element);
      } else {
        selectedEvents[element.date] = [element];
      }
    });


  }

  String convertDatetimeToDate(DateTime x) {
    return x.toString().substring(0, 10);
  }
}
