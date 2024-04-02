import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:study/features/calendar/event.dart';

import '../../common/constant.dart';

class CalendarProvider extends ChangeNotifier {

  Stream<Map<String, List<Event>>> getEvent() async* {
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

    Map<String, List<Event>> selectedEvents = {};
    events.forEach((element) {
      if (selectedEvents[element.date] != null) {
        selectedEvents[element.date]?.add(element);
      } else {
        selectedEvents[element.date] = [element];
      }
    });

    yield selectedEvents;
  }
}
