import 'package:egg_app/domain/model/order.dart';

abstract class OrderPort{
  saveOrder(Order order);
}