import 'package:egg_app/adapter/out/order_adapter.dart';
import 'package:egg_app/domain/core/module_container.dart';
import 'package:egg_app/domain/model/contact_details.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:egg_app/domain/model/user.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final injector = await ModuleContainer().initialise(Injector());
  OrderAdapter orderAdapter = injector.get<OrderAdapter>();
  testWidgets('failing test example', (tester) async {
    ContactDetails contactDetails = ContactDetails("curtis", "schwoebel", "curtis.schwoebel@gmail.com", "0735332487");
    User user = User(contactDetails, "qweasd");
    Order order = Order(user, [Egg()]);
    orderAdapter.saveOrder(order);
    expect(orderAdapter, isNotNull);
  });
}