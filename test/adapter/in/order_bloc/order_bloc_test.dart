import 'package:egg_app/adapter/in/order_bloc/order_bloc.dart';
import 'package:egg_app/application/ports/out/order_port.dart';
import 'package:egg_app/application/use_cases/complete_order_usecase.dart';
import 'package:egg_app/application/use_cases/take_order_usecase.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../application/use_cases/take_order_usecase_test.mocks.dart';

@GenerateMocks([OrderPort])
void main() {
  const TypeMatcher<OrderInitial> orderInitial = TypeMatcher<OrderInitial>();
  CompleteOrderUseCase completeOrderUseCase = CompleteOrderUseCase();
  TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase(MockOrderPort());
  const OrderChanging orderChanging = OrderChanging();
  const OrderCancelling orderCancelling = OrderCancelling();
  const OrderPlacing orderPlacing = OrderPlacing();
  const OrderCompleting orderCompleting = OrderCompleting();
  OrderBloc orderBloc = OrderBloc(completeOrderUseCase, takeOrderUseCase);
  group("OrderBloc Placing", () {
    Order? order;
    setUp(() {
      order = Order([]);
      order?.userId = "asdqwe123";
    });
    test("Initial State is OrderInitial", () {
      expectLater(orderBloc.state, orderInitial);
    });

    blocTest<OrderBloc, OrderState>(
      'Can place an order',
      setUp: () {
        when(takeOrderUseCase.orderPort.saveOrder(order!))
            .thenAnswer((_) async => true);
      },
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(TakeOrder(order!)),
      expect: () => <OrderState>[orderPlacing, OrderPlaced(order!)],
    );

    tearDown(() {
      orderBloc.close();
    });
  });

  group("OrderBloc Changing", () {
    Order? order;
    setUp(() {
      order = Order([]);
      order?.userId = "asdqwe123";
      when(takeOrderUseCase.orderPort.saveOrder(order!))
          .thenAnswer((_) async => true);
      takeOrderUseCase.registerOrder(order!);
    });

    blocTest<OrderBloc, OrderState>(
      'Can change an order',
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) {
        order?.eggs = [Egg(), Egg()];
        bloc.add(ChangeOrder(order!));
      },
      expect: () => <OrderState>[orderChanging, OrderPlaced(order!)],
    );
  });
  group("OrderBloc Cancelling", () {
    Order? order;
    setUp(() {
      order = Order([]);
      order?.userId = "asdqwe123";
      when(takeOrderUseCase.orderPort.saveOrder(order!))
          .thenAnswer((_) async => true);
      takeOrderUseCase.registerOrder(order!);
    });

    blocTest<OrderBloc, OrderState>(
      'Can cancel an order',
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(CancelOrder(order!)),
      expect: () => <OrderState>[orderCancelling, OrderCancelled(order!)],
    );
  });
  group("OrderBloc Completing", () {
    Order? order;
    setUp(() {
      order = Order([]);
      order?.userId = "asdqwe123";
      when(takeOrderUseCase.orderPort.saveOrder(order!))
          .thenAnswer((_) async => true);
      takeOrderUseCase.registerOrder(order!);
    });

    blocTest<OrderBloc, OrderState>(
      'Can complete an order',
      setUp: () {
        when(takeOrderUseCase.orderPort.saveOrder(order!))
            .thenAnswer((_) async => true);
      },
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(CompleteOrder(order!)),
      expect: () => <OrderState>[orderCompleting, OrderComplete(order!)],
    );
  });
}
