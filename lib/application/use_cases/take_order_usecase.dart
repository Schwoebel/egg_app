import 'package:clock/clock.dart';
import 'package:eggp_app/domain/enum/order_status_enum.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/order_timer.dart';

import '../ports/in/take_order_port.dart';

class TakeOrderUseCase implements TakeOrder{

  TakeOrderUseCase();

  @override
  Order registerOrder(Order order) {
    order.createdTime = clock.now();
    order.deliveryDate = OrderTimer.orderDeliveryDate(order);
    order.id = "asdqwe";
    order.status = OrderStatus.placed;
    return order;
  }

  @override
  Order changeOrder(Order changedOrder) {
    changedOrder.createdTime = clock.now();
    changedOrder.changed = true;
    changedOrder.deliveryDate = OrderTimer.orderDeliveryDate(changedOrder);
    return changedOrder;
  }

  @override
  Order cancelOrder(Order order) {
    order.status = OrderStatus.cancelled;
    return order;
  }
}