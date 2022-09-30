import 'package:clock/clock.dart';
import 'package:eggp_app/domain/model/order_timer.dart';
import 'package:eggp_app/domain/model/user.dart';

import '../enum/order_status_enum.dart';
import 'egg.dart';

class Order{
  List<Egg> eggs;
  final User orderMaker;
  late DateTime createdTime;
  late DateTime deliveryDate;
  late OrderStatus status;
  late bool changed = false;
  late String id;
  Order(this.orderMaker, this.eggs){
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