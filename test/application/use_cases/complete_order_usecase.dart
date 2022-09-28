import 'package:eggp_app/application/use_cases/complete_order_usecase.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Can be created", (){
    CompleteOrderUseCase completeOrderUseCase = CompleteOrderUseCase();
    expect(completeOrderUseCase, isInstanceOf<CompleteOrderUseCase>());
  });

  test("Order marked complete", (){
    ContactDetails contactDetails = ContactDetails("curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
    User user = User(contactDetails, "qweasd");
    Order order = Order(user, 1);
    order.placed = true;
    CompleteOrderUseCase completeOrderUseCase = CompleteOrderUseCase();
    completeOrderUseCase.completeOrder(order);
    expect(order.isComplete, equals(true));
  });
}