import 'package:cloud_firestore/cloud_firestore.dart';

class DateTimeConverter {
  DateTime convert(Timestamp timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(
        timestamp.millisecondsSinceEpoch * 1000);
  }
}
