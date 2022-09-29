part of 'order_bloc.dart';

@immutable
abstract class OrderState extends Equatable {
  const OrderState([List props = const []]) : super();
}

class OrderInitial extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderPlacing extends OrderState {
  final Order order;
  const OrderPlacing(this.order);
  @override
  List<Object?> get props => [order];
}

class OrderUnchangeable extends OrderState {
  final Order order;
  const OrderUnchangeable(this.order);
  @override
  List<Object?> get props => [order];
}

class OrderPlaced extends OrderState {
  final Order order;
  const OrderPlaced(this.order);
  @override
  List<Object?> get props => [order];
}

class OrderCompleting extends OrderState {
  final Order order;
  const OrderCompleting(this.order);
  @override
  List<Object?> get props => [order];
}

class OrderComplete extends OrderState {
  final Order order;
  const OrderComplete(this.order);
  @override
  List<Object?> get props => [order];
}