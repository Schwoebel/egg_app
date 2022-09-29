import 'package:eggp_app/domain/enum/order_status_enum.dart';
import 'package:eggp_app/domain/model/order.dart';

import '../ports/in/take_order_port.dart';

class TakeOrderUseCase implements TakeOrder{

  TakeOrderUseCase();

  @override
  Order registerOrder(Order order) {
    order.status = OrderStatus.placed;
    return order;
  }

  @override
  changeOrder(Order changedOrder, String currentOrderId) {

  }

  @override
  cancelOrder(String orderId) {
    throw UnimplementedError();
  }
}