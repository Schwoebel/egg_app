import 'package:eggp_app/adapter/in/order_bloc/order_bloc.dart';
import 'package:eggp_app/domain/enum/order_status_enum.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Order Events", (){
    Order? order;
    setUp((){
      ContactDetails contactDetails = ContactDetails("curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
      User user = User(contactDetails, "qweasd");
      order = Order(user, 1);
    });
    test("Should create PlaceOrder", (){
      TakeOrder placeOrder = TakeOrder(order!);
      expect(placeOrder.props.length, equals(1));
      expect((placeOrder.props.elementAt(0) as Order).status, equals(OrderStatus.building));
    });
    test("Should create CancelOrder", (){
      CancelOrder placeOrder = CancelOrder(order!);
      expect(placeOrder.props.length, equals(1));
      expect((placeOrder.props.elementAt(0) as Order).status, equals(OrderStatus.building));
    });
    test("Should create ChangeOrder", (){
      ChangeOrder placeOrder = ChangeOrder(order!);
      expect(placeOrder.props.length, equals(1));
      expect((placeOrder.props.elementAt(0) as Order).status, equals(OrderStatus.building));
    });
  });

}