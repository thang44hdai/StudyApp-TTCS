import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'common/constant.dart';

class Utils {
  static void DialogBase(String title, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are You Sure"),
          content: Text(title),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  static Widget NotConnectServer() {
    return Container(
      height: Constants.screenWidth,
      width: Constants.screenWidth,
      child: Lottie.asset('assets/404.json'),
    );
  }
}
