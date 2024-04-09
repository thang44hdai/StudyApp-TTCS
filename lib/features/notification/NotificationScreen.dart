import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/calendar/CalendarProvider.dart';

import '../calendar/event.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Map<String, List<Event>> selectedEvents;

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[convertDatetimeToDate(date)] ?? [];
  }

  String convertDatetimeToDate(DateTime x) {
    return x.toString().substring(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDay = DateTime.now();
    CalendarProvider viewmodel = Provider.of<CalendarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Thông báo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: Constants.screenHeight,
        color: ColorResources.mainBackGround(),
        child: Stack(
          children: [
            Container(
              height: Constants.screenHeight / 20,
              decoration: BoxDecoration(color: Colors.red),
            ),
            Positioned(
              top: Constants.screenHeight / 20 - 10,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.mainBackGround(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: StreamBuilder(
                    stream: viewmodel.getEvent(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        selectedEvents = snapshot.data ?? {};
                        if (selectedEvents.length == 0) {
                          return Text("Hôm nay không có sự kiện gì");
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Hôm nay là ngày ${convertDatetimeToDate(selectedDay)}"),
                              Expanded(
                                  child: ListView.builder(
                                itemCount:
                                    _getEventsfromDay(selectedDay).length,
                                itemBuilder: (context, index) {
                                  Event event =
                                      _getEventsfromDay(selectedDay)[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          event.title,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        leading: event!.time != ""
                                            ? Text(
                                                event.time,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              )),
                            ],
                          );
                        }
                      } else {
                        return Text("Error");
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
