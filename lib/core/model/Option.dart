import 'package:flutter/cupertino.dart';

class Option {
  final String code;
  final String text;
  final bool isCorrect;

  const Option(
    this.text,
    this.code,
    this.isCorrect,
  );
}
