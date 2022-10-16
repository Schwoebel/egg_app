import 'package:clock/clock.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:egg_app/domain/model/order_timer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Order placing", () {
    Order? order;
    DateTime justInTime = DateTime(2022, 6, 6, 8, 59, 59);
    DateTime justOutOfTime = DateTime(2022, 6, 6, 9, 15);
    DateTime forTomorrow = DateTime(2022, 6, 6, 10, 0, 0);
    setUpAll(() {
      order = Order("asdqwe123", [Egg(), Egg()]);
      order?.createdTime = DateTime(2022, 6, 6, 7, 30);
    });
    test("Orders cannot be placed", () {
      final bool canOrder = withClock(Clock.fixed(justOutOfTime), () {
        return OrderTimer.canOrderBeCreated();
      });
      expect(canOrder, equals(false));
    });

    test("Orders can be placed", () {
      final bool canOrder = withClock(Clock.fixed(justInTime), () {
        return OrderTimer.canOrderBeCreated();
      });
      expect(canOrder, equals(true));
    });

    test("Order was created, but wasn't submitted in time", () {
      final bool canOrder = withClock(Clock.fixed(justOutOfTime), () {
        return OrderTimer.canOrderBePlaced(order!);
      });
      expect(canOrder, equals(false));
    });

    test("Order was created and submitted on time", () {
      final bool canOrder = withClock(Clock.fixed(justInTime), () {
        return OrderTimer.canOrderBePlaced(order!);
      });
      expect(canOrder, equals(true));
    });

    test("Order will be delivered today", () {
      final DateTime deliveryDate = withClock(Clock.fixed(justInTime), () {
        return OrderTimer.orderDeliveryDate(order!);
      });
      expect(deliveryDate.day, equals(6));
    });

    test("Order will be delivered tomorrow", () {
      final DateTime deliveryDate = withClock(Clock.fixed(forTomorrow), () {
        return OrderTimer.orderDeliveryDate(order!);
      });
      expect(deliveryDate.day, equals(7));
    });
  });
}
