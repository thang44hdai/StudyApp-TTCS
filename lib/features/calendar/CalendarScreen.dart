import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: CalendarBody(),
    );
  }
}

class CalendarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(child: Container(child: Text('Sun'))),
            TableCell(child: Container(child: Text('Mon'))),
            TableCell(child: Container(child: Text('Tue'))),
            TableCell(child: Container(child: Text('Wed'))),
            TableCell(child: Container(child: Text('Thu'))),
            TableCell(child: Container(child: Text('Fri'))),
            TableCell(child: Container(child: Text('Sat'))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Container(child: Text('1'))),
            TableCell(child: Container(child: Text('2'))),
            TableCell(child: Container(child: Text('3'))),
            TableCell(child: Container(child: Text('4'))),
            TableCell(child: Container(child: Text('5'))),
            TableCell(child: Container(child: Text('6'))),
            TableCell(child: Container(child: Text('7'))),
          ],
        ),
        // Add more rows for additional weeks
      ],
    );
  }
}
