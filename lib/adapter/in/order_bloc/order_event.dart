part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent(Order order) : super();
}


class TakeOrder extends OrderEvent{
  final Order order;
  const TakeOrder(this.order): super(order);

  @override
  List<Object?> get props => [order];
}

class CancelOrder extends OrderEvent{
  final Order order;
  const CancelOrder(this.order): super(order);

  @override
  List<Object?> get props => [order];
}

class ChangeOrder extends OrderEvent{
  final Order order;
  const ChangeOrder(this.order): super(order);

  @override
  List<Object?> get props => [order];
}

class CompleteOrder extends OrderEvent{
  final Order order;
  const CompleteOrder(this.order): super(order);

  @override
  List<Object?> get props => [props];
}