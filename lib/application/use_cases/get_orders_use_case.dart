import '../../domain/model/contact_details.dart';
import '../../domain/model/egg.dart';
import '../../domain/model/order.dart';
import '../../domain/model/user.dart';
import '../ports/in/get_orders_port.dart';

class GetOrdersUseCase implements GetOrdersPort {
  @override
  Map<String, Set<Order>> getAllOrders() {
    ContactDetails contactDetails1 = ContactDetails(
        "curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
    User user1 = User(contactDetails1, "asdqwe123");
    ContactDetails contactDetails2 = ContactDetails(
        "sofia", "schwoebel", "sofia.schwoebel@gmail.com", "123456789");
    User user2 = User(contactDetails2, "asdqwe124");
    ContactDetails contactDetails3 = ContactDetails(
        "cash", "schwoebel", "cash.schwoebel@gmail.com", "987654312");
    User user3 = User(contactDetails3, "asdqwe125");
    return {
      user1.prettyContactName: {
        Order("asdqwe123", [Egg()])
      },
      user2.prettyContactName: {
        Order("asdqwe124", [Egg()])
      },
      user3.prettyContactName: {
        Order("asdqwe125", [Egg()])
      }
    };
  }

  @override
  Set<Order>? getUserOrders(User user) {
    return getAllOrders()[user.prettyContactName];
  }

  @override
  Set getOrdersByDate(DateTime date) {
    Set orders = getAllOrders().values.expand((element) => element).toSet();
    return orders;
  }
}
