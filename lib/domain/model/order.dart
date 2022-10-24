import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:egg_app/domain/model/order_timer.dart';

import '../enum/order_status_enum.dart';
import 'egg.dart';

class Order {
  List<Egg> eggs;
  late final String userId;
  late String userNiceName;
  late DateTime createdTime;
  late DateTime deliveryDate;
  late OrderStatus status;
  late bool changed = false;
  late String id;
  Order(this.eggs) {
    createdTime = clock.now();
    status = OrderStatus.building;
    deliveryDate = OrderTimer.orderDeliveryDate(this);
  }

  void toggleComplete() {
    status = OrderStatus.complete;
  }

  void cancelOrder() {
    status = OrderStatus.cancelled;
  }

  Map<String, dynamic> toJson() => {
        "eggs": jsonEncode(eggs),
        "orderMaker": userId,
        "created": createdTime.toString(),
        "orderStatus": status.toString(),
        "changed": changed.toString(),
        "deliveryDate": deliveryDate.toString()
      };
  Order.fromJson(Map<String, dynamic> orderMap)
  : eggs = List<Egg>.from(orderMap['eggs'].map((egg) => Egg.fromString(egg)));

}
