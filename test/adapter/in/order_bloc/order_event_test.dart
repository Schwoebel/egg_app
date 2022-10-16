import 'package:egg_app/adapter/in/order_bloc/order_bloc.dart';
import 'package:egg_app/domain/enum/order_status_enum.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Order Events", (){
    Order? order;
    setUp((){
      order = Order("asdqwe123", [Egg()]);
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