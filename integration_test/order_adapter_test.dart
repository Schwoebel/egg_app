import 'package:egg_app/adapter/out/firestore/order_collection_adapter.dart';
import 'package:egg_app/domain/core/module_container.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';


Future<void> main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').add({
    'username': 'Bob',
  });
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.length); // 1
  print(snapshot.docs.first.get('username')); // 'Bob'
  print(instance.dump());
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final injector = await ModuleContainer().initialise(Injector());
  OrderCollectionAdapter orderAdapter = injector.get<OrderCollectionAdapter>();
  testWidgets('failing test example', (tester) async {
    Order order = Order("asdqwe123", [Egg()]);
    orderAdapter.saveOrder(order);
    expect(orderAdapter, isNotNull);
  });
}