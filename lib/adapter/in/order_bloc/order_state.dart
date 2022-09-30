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
  const OrderPlacing();
  @override
  List<Object?> get props => [];
}

class OrderChanging extends OrderState {
  const OrderChanging();
  @override
  List<Object?> get props => [];
}

class OrderCancelling extends OrderState {
  const OrderCancelling();
  @override
  List<Object?> get props => [];
}

class OrderCancelled extends OrderState {
  final Order order;
  const OrderCancelled(this.order);
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
  const OrderCompleting();
  @override
  List<Object?> get props => [];
}

class OrderComplete extends OrderState {
  final Order order;
  const OrderComplete(this.order);
  @override
  List<Object?> get props => [order];
}