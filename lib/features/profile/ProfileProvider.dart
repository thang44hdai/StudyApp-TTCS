import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../../common/constant.dart';

class ProfileProvider extends ChangeNotifier {
  Stream<Information> getInformation() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection("users")
        .doc(Constants.userId)
        .snapshots()
        .map((element) {
      String email = element.data()?["account"] ?? "";
      String name = element.data()?["name"] ?? "";
      List<dynamic> history = element.data()?["history"] ?? [];
      List<String> _history = history.cast<String>().toList();
      return Information(email: email, name: name, history: _history);
    });
  }
}

class Information {
  final String email;
  final String name;
  final List<String> history;

  Information(
      {String email = "", String name = "", List<String> history = const []})
      : this.email = email,
        this.name = name,
        this.history = history;
}
