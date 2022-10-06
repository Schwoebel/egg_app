import 'package:eggp_app/application/ports/out/order_port.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:firebase_core/firebase_core.dart';

class OrderAdapter implements OrderPort{
  Firebase firebase;
  OrderAdapter({required this.firebase});
  @override
  saveOrder(Order order) {

    throw UnimplementedError();
  }
}