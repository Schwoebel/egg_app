import 'package:eggp_app/application/ports/out/order_port.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class OrderAdapter implements OrderPort{
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  OrderAdapter();
  @override
  saveOrder(Order order) {

    throw UnimplementedError();
  }
}