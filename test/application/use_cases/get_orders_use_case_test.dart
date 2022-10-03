import 'package:eggp_app/application/ports/in/get_orders_port.dart';
import 'package:eggp_app/application/use_cases/get_orders_use_case.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("GetOrderUseCaseTest", () {
    GetOrdersUseCase? getOrdersUseCase;
    ContactDetails? contactDetails;
    setUp(() {
      getOrdersUseCase = GetOrdersUseCase();
      contactDetails = ContactDetails(
          "curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
    });

    test("Can be created", () {
      expect(getOrdersUseCase, isInstanceOf<GetOrdersPort>());
      expect(getOrdersUseCase, isInstanceOf<GetOrdersUseCase>());
    });

    test("Returns not null", () {
      expect(getOrdersUseCase?.getAllOrders(), isNotNull);
    });

    test("Returns a Map of orders arranged by user", () {
      User user = User(contactDetails!, "qweasd");
      Map<String, Set<Order>>? allUserOrders = getOrdersUseCase?.getAllOrders();
      expect(allUserOrders?.keys, contains(user.prettyContactName));
      expect(allUserOrders?.length, equals(3));
    });

    test("Returns Orders of a specific User", () {
      User user = User(contactDetails!, "qweasd");
      Set<Order>? specificUserOrders = getOrdersUseCase?.getUserOrders(user);
      expect(specificUserOrders?.length, equals(1));
    });

    test("Returns Orders by a specific date", (){
      Set<Order>? specificDateOrders = getOrdersUseCase?.getOrdersByDate(DateTime.now()).cast<Order>();
      expect(specificDateOrders?.length, equals(3));
    });
  });
}
