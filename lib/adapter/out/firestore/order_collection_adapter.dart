import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egg_app/application/ports/out/order_port.dart';
import 'package:egg_app/domain/model/order.dart';

class OrderCollectionAdapter implements OrderPort{
  final CollectionReference _orderCollectionReference;
  OrderCollectionAdapter(this._orderCollectionReference);
  @override
  saveOrder(Order order) async {
    return await _orderCollectionReference.add(order.toJson()).then((value) => value.id);
  }
}