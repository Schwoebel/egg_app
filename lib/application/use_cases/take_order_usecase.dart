import 'package:eggp_app/domain/model/order.dart';

import '../ports/in/take_order_port.dart';

class TakeOrderUseCase implements TakeOrder{

  TakeOrderUseCase();

  @override
  Order registerOrder(Order order) {
    order.placed = true;
    return order;
  }
}