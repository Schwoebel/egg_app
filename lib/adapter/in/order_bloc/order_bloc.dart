import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../application/use_cases/complete_order_usecase.dart';
import '../../../application/use_cases/take_order_usecase.dart';
import '../../../domain/model/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CompleteOrderUseCase completeOrderUseCase;
  final TakeOrderUseCase takeOrderUseCase;
  OrderBloc(this.completeOrderUseCase, this.takeOrderUseCase) : super(OrderInitial()) {
    on<CancelOrder>(_cancelOrder);
    on<TakeOrder>(_placeOrder);
    on<ChangeOrder>(_changeOrder);
    on<CompleteOrder>(_completeOrder);
  }

  FutureOr<void> _placeOrder(OrderEvent event, Emitter<OrderState> orderStateEmitter) {
    Order order = event.props.first as Order;
    orderStateEmitter(const OrderPlacing());
    takeOrderUseCase.registerOrder(order);
    orderStateEmitter(OrderPlaced(order));
  }
  void _changeOrder(OrderEvent event, Emitter<OrderState> orderStateEmitter){
    Order order = event.props.first as Order;
    orderStateEmitter(const OrderChanging());
    takeOrderUseCase.changeOrder(order);
    orderStateEmitter(OrderPlaced(order));
  }
  void _cancelOrder(OrderEvent event, Emitter<OrderState> orderStateEmitter){
    Order order = event.props.first as Order;
    orderStateEmitter(const OrderCancelling());
    takeOrderUseCase.cancelOrder(order);
    orderStateEmitter(OrderCancelled(order));
  }
  void _completeOrder(OrderEvent event, Emitter<OrderState> orderStateEmitter){
    Order order = event.props.first as Order;
    orderStateEmitter(const OrderCompleting());
    completeOrderUseCase.completeOrder(order);
    orderStateEmitter(OrderComplete(order));
  }
}
