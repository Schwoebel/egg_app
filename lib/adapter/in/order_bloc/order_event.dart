part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent([List props = const []]);
}


class PlaceOrder extends OrderEvent{
  final Order order;
  PlaceOrder(this.order): super([order]);

  @override
  List<Object?> get props => [order];
}

class CancelOrder extends OrderEvent{
  final Order order;
  CancelOrder(this.order): super([order]);

  @override
  List<Object?> get props => [order];
}

class ChangeOrder extends OrderEvent{
  final Order order;
  ChangeOrder(this.order): super([order]);

  @override
  List<Object?> get props => [order];
}