import 'package:egg_app/application/ports/out/order_port.dart';
import 'package:egg_app/application/use_cases/take_order_usecase.dart';
import 'package:egg_app/domain/enum/order_status_enum.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'take_order_usecase_test.mocks.dart';

@GenerateMocks([OrderPort])
void main(){

  TakeOrderUseCase? takeOrderUseCase;
  group("Order management", (){
    Order? order;
    setUpAll((){
      takeOrderUseCase = TakeOrderUseCase(MockOrderPort());
      order = Order("asdqwe123", [Egg()]);
    });
    test("Can be created", (){
      expect(takeOrderUseCase, isInstanceOf<TakeOrderUseCase>());
    });

    test("Can take order", (){
      when(takeOrderUseCase?.orderPort.saveOrder(order!)).thenReturn(order);
      takeOrderUseCase?.registerOrder(order!);
      expect(order?.id, isNot(null));
      expect(order?.createdTime, isNot(null));
      expect(order?.deliveryDate, isNot(null));
    });

    test("Can change Order", (){
      order?.eggs = [Egg(), Egg()];
      takeOrderUseCase?.changeOrder(order!);
      expect(order?.changed, equals(true));
    });

    test("Can cancel order", (){
      takeOrderUseCase?.cancelOrder(order!);
      expect(order?.status, equals(OrderStatus.cancelled));
    });
  });

}