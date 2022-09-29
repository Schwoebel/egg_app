import 'package:eggp_app/application/use_cases/take_order_usecase.dart';
import 'package:eggp_app/domain/enum/order_status_enum.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Can be created", (){
    TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase();
    expect(takeOrderUseCase, isInstanceOf<TakeOrderUseCase>());
  });

  test("Can take order", (){
    ContactDetails contactDetails = ContactDetails("curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
    User user = User(contactDetails, "qweasd");
    Order order = Order(user, 1);
    TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase();
    takeOrderUseCase.registerOrder(order);
    expect(order.status, equals(OrderStatus.placed));
  });
}