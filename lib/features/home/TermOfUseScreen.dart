import 'package:flutter/material.dart';

class TermOfUserScreen extends StatefulWidget {
  const TermOfUserScreen({super.key});

  @override
  State<TermOfUserScreen> createState() => _TermOfUserScreenState();
}

class _TermOfUserScreenState extends State<TermOfUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text(
          "Điều khoản",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
