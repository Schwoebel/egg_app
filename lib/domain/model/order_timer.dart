import 'package:clock/clock.dart';

import 'order.dart';

class OrderTimer{
  static bool canOrderBeCreated(){
    if(clock.now().hour == 9){
      return false;
    }
    return true;
  }

  static bool canOrderBePlaced(Order order){
    if(order.createdTime.hour < 9 && clock.now().hour == 9){
      return false;
    }
    return true;
  }

  static DateTime orderDeliveryDate(Order order){
    DateTime rightNow = clock.now();
    if(rightNow.hour > 8){
      return clock.daysFromNow(1);
    } else {
      return clock.now();
    }

  }
}