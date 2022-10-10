import 'package:egg_app/adapter/in/order_bloc/order_bloc.dart';
import 'package:egg_app/application/use_cases/complete_order_usecase.dart';
import 'package:egg_app/application/use_cases/take_order_usecase.dart';
import 'package:egg_app/domain/model/contact_details.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:egg_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  const TypeMatcher<OrderInitial> orderInitial = TypeMatcher<OrderInitial>();
  ContactDetails contactDetails = ContactDetails(
      "Curtis", "Schwoebel", "curtis.schwoebel@gmail.com", "0735334287");
  User user = User(contactDetails, "asdqwe123");
  CompleteOrderUseCase completeOrderUseCase = CompleteOrderUseCase();
  TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase();
  const OrderChanging orderChanging = OrderChanging();
  const OrderCancelling orderCancelling = OrderCancelling();
  const OrderPlacing orderPlacing = OrderPlacing();
  const OrderCompleting orderCompleting = OrderCompleting();
  OrderBloc orderBloc = OrderBloc(completeOrderUseCase, takeOrderUseCase);
  group("OrderBloc Placing", () {
    Order? order;
    setUp(() {
      order = Order(user, []);
    });
    test("Initial State is OrderInitial", () {
      expectLater(orderBloc.state, orderInitial);
    });

    blocTest<OrderBloc, OrderState>(
      'Can place an order',
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
      order = Order(user, [Egg()]);
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
      order = Order(user, [Egg()]);
      takeOrderUseCase.registerOrder(order!);
    });

    blocTest<OrderBloc, OrderState>(
      'Can cancel an order',
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(CancelOrder(order!)),
      expect: () =>
          <OrderState>[orderCancelling, OrderCancelled(order!)],
    );
  });
  group("OrderBloc Completing", () {
    Order? order;
    setUp(() {
      order = Order(user, [Egg()]);
      takeOrderUseCase.registerOrder(order!);
    });

    blocTest<OrderBloc, OrderState>(
      'Can complete an order',
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(CompleteOrder(order!)),
      expect: () =>
      <OrderState>[orderCompleting, OrderComplete(order!)],
    );
  });
}
