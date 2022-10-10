import 'package:egg_app/application/ports/out/order_port.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:firebase_database/firebase_database.dart';

class OrderAdapter implements OrderPort{
  final FirebaseDatabase _firebaseDatabase;
  OrderAdapter(this._firebaseDatabase);
  @override
  saveOrder(Order order) {
    print(_firebaseDatabase.app.options.appId);
  }
}