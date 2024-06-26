import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/features/quiz_test/provider/TimberProvider.dart';
import 'package:study/features/result_test/ResultScreen.dart';

import '../../utils.dart';

class CountdownTimer extends StatefulWidget {
  final int timber;

  const CountdownTimer({required this.timber, super.key});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _secondsRemaining = 0;
  late Timer _timer;
  late TimberProvider viewmodel;

  @override
  void initState() {
    super.initState();

    _secondsRemaining = widget.timber;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel(); // Dừng đồng hồ khi hết thời gian
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hủy timer khi widget bị xóa khỏi cây widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var time = "";
    if (_secondsRemaining < 60)
      time = "${_secondsRemaining.toString()}s";
    else if (_secondsRemaining < 3600)
      time = "${_secondsRemaining ~/ 60}m ${_secondsRemaining % 60}s";
    else if (_secondsRemaining < 86400) {
      var h = _secondsRemaining ~/ 3600;
      _secondsRemaining %= 3600;
      var m = _secondsRemaining ~/ 60;
      _secondsRemaining %= 60;
      time = "${h}h ${m}m ${_secondsRemaining}s";
    }
    if (_secondsRemaining == 0) {
      return const Text(
        "Submitted",
        style: TextStyle(color: Colors.white, fontSize: 16),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text(
          "$time",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }
  }
}
