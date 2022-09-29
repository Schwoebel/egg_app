import 'package:clock/clock.dart';
import 'package:eggp_app/domain/enum/order_status_enum.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Order", (){
    Order? order;
    User user;
    setUp((){
      ContactDetails contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com","0735334287");
      user = User(contactDetails, "asdqwe123");
      order = Order(user, 0);
    });

    test("should Instantiate an Order", (){
      expect(order, isInstanceOf<Order>());
    });

    test("should have an orderer", (){
      expect(order?.orderMaker, isInstanceOf<User>());
    });

    test("should have at eggCount", (){
      order?.eggCount = 1;
      expect(order?.eggCount, equals(1));
    });

    test("should be marked complete", (){
      expect(order?.status, equals(OrderStatus.building));
    });

    test("complete should be togglable", (){
      order?.toggleComplete();
      expect(order?.status, equals(OrderStatus.complete));
    });

    test("should have a createTime", (){
      expect(order?.createdTime.minute, equals(const Clock().now().minute));
    });

    test("on creation an order should not be cancelled", (){
      expect(order?.status, isNot(OrderStatus.cancelled));
    });

    test("when cancelled an order should be cancelled", (){
      order?.cancelOrder();
      expect(order?.status, equals(OrderStatus.cancelled));
    });
    test("the order should be changeable", (){
      expect(order?.changed, equals(false));
    });
    test("the order should be changed", (){
      order?.changed = true;
      expect(order?.changed, equals(true));
    });
  });
}
