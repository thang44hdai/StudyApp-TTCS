import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  Stream<List<QrItem>> getListQr() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        firestore.collection('qr_codes').snapshots();

    return snapshots.map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<QrItem> response = [];
      querySnapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data()!;
        String title = data["title"].toString();
        String image = data["image"].toString();
        response.add(QrItem(title: title, image: image));
      });

      return response;
    });
  }
}

class QrItem {
  String title;
  String image;

  QrItem({required this.title, required this.image});

  QrItem.empty()
      : title = "",
        image = "";
}
