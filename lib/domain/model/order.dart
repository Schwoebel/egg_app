import 'package:clock/clock.dart';
import 'package:eggp_app/domain/model/order_timer.dart';
import 'package:eggp_app/domain/model/user.dart';

import '../enum/order_status_enum.dart';

class Order{
  int eggCount;
  final User orderer;
  late final DateTime createdTime;
  late final DateTime deliveryDate;
  late OrderStatus status;
  late bool changed = false;
  Order(this.orderer, this.eggCount){
    createdTime = clock.now();
    status = OrderStatus.building;
    deliveryDate = OrderTimer.orderDeliveryDate(this);
  }

  void toggleComplete() {
    status = OrderStatus.complete;
  }

  void cancelOrder(){
    status = OrderStatus.cancelled;
  }

}