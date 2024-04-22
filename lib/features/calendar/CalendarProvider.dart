import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:study/features/calendar/event.dart';

import '../../common/constant.dart';

class CalendarProvider extends ChangeNotifier {
 // return firestore bởi vì streambuilder sẽ update theo data trả về nên neesu để data lấy về rồi set măcj định thì UI cũng khng được update
  Stream<Map<String, List<Event>>> getEvent() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return firestore
        .collection("events")
        .doc(Constants.userId)
        .snapshots()
        .map((snapshot) {
      List<dynamic> eventsData = snapshot.data()?['doc'] ?? [];
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

      return selectedEvents;
    });
  }
}
