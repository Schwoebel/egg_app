import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:egg_app/domain/enum/order_status_enum.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Order", (){
    Order? order;
    setUp((){
      order = Order("asdqwe123", [Egg()]);
    });

    test("should Instantiate an Order", (){
      expect(order, isInstanceOf<Order>());
    });

    test("should have an orderer", (){
      expect(order?.userId, isNotNull);
    });

    test("should have at eggCount", (){
      order?.eggs = [Egg()];
      expect(order?.eggs.length, equals(1));
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
    test("The Order should have an Id", (){
      order?.id = "qweasd";
      expect(order?.id, "qweasd");
    });
    test("The order should be converted to Json", (){
      String jsonString = jsonEncode(order?.toJson());
      Map<String, dynamic> orderMappedFromJson = jsonDecode(jsonString);
      expect(orderMappedFromJson['orderMaker'], equals("asdqwe123"));
    });
  });
}
