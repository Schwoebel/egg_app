import 'package:cloud_firestore/cloud_firestore.dart';

import 'order.dart';

class Breakfast {
  static final DateTime _defaultDate = DateTime.now();
  late DateTime date;
  late int orderCount;
  late Set<Order> orders;

  Breakfast({DateTime? date})
  : date = date ?? _defaultDate;

  Breakfast.fromJson(Map<String, dynamic> jsonMap)
  : date = Timestamp(jsonMap['date']['milliseconds'],0).toDate(),
  orderCount = jsonMap["orderCount"],
  orders = Set<dynamic>.from(jsonMap["orders"]).map((e) => Order.fromJson(e)).toSet();

}