import 'package:eggp_app/adapter/in/order_bloc/order_bloc.dart';
import 'package:eggp_app/application/use_cases/complete_order_usecase.dart';
import 'package:eggp_app/application/use_cases/take_order_usecase.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  const TypeMatcher<OrderInitial> orderInitial = TypeMatcher<OrderInitial>();
  const TypeMatcher<OrderPlacing> orderPlacing = TypeMatcher<OrderPlacing>();
  group("OrderBloc", () {
    Order? order;
    User user;
    CompleteOrderUseCase completeOrderUseCase = CompleteOrderUseCase();
    TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase();
    OrderBloc orderBloc = OrderBloc(completeOrderUseCase, takeOrderUseCase);
    setUp(() {
      ContactDetails contactDetails = ContactDetails(
          "Curtis", "Schwoebel", "curtis.schwoebel@gmail.com", "0735334287");
      user = User(contactDetails, "asdqwe123");
      order = Order(user, 0);
    });
    test("Initial State is OrderInitial", () {
      expectLater(orderBloc.state, orderInitial);
    });

    blocTest<OrderBloc, OrderState>(
      'Can place an order',
      build: () => OrderBloc(completeOrderUseCase, takeOrderUseCase),
      act: (bloc) => bloc.add(TakeOrder(order!)),
      expect: () => <OrderState>[OrderPlacing(order!), OrderPlaced(order!)],
    );

    tearDown(() {
      orderBloc.close();
    });
  });
}
