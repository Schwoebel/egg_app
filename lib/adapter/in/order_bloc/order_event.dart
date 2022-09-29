part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent([List props = const []]) : super();
}


class TakeOrder extends OrderEvent{
  final Order order;
  TakeOrder(this.order): super([order]);

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

class CompleteOrder extends OrderEvent{
  final Order order;
  CompleteOrder(this.order): super([order]);

  @override
  List<Object?> get props => [props];
}