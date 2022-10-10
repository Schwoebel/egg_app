import 'package:egg_app/application/ports/in/complete_order_port.dart';
import 'package:egg_app/domain/model/order.dart';

class CompleteOrderUseCase implements CompleteOrder{
  CompleteOrderUseCase();

  @override
  Order completeOrder(Order order) {
    order.toggleComplete();
    return order;
  }
}