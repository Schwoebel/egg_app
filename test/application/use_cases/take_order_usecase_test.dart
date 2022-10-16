import 'package:egg_app/application/use_cases/take_order_usecase.dart';
import 'package:egg_app/domain/enum/order_status_enum.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  TakeOrderUseCase takeOrderUseCase = TakeOrderUseCase();
  group("Order management", (){
    Order? order;
    setUpAll((){
      order = Order("asdqwe123", [Egg()]);
    });
    test("Can be created", (){
      expect(takeOrderUseCase, isInstanceOf<TakeOrderUseCase>());
    });

    test("Can take order", (){
      takeOrderUseCase.registerOrder(order!);
      expect(order?.status, equals(OrderStatus.placed));
      expect(order?.id, isNot(null));
      expect(order?.createdTime, isNot(null));
      expect(order?.deliveryDate, isNot(null));
    });

    test("Can change Order", (){
      order?.eggs = [Egg(), Egg()];
      takeOrderUseCase.changeOrder(order!);
      expect(order?.changed, equals(true));
    });

    test("Can cancel order", (){
      takeOrderUseCase.cancelOrder(order!);
      expect(order?.status, equals(OrderStatus.cancelled));
    });
  });

}