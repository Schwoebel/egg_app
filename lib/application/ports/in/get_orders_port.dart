import '../../../domain/model/user.dart';

abstract class GetOrdersPort{
  getAllOrders();
  getUserOrders(User user);
  getOrdersByDate(DateTime date);
}