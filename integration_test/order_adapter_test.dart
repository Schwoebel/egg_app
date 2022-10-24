import 'package:egg_app/adapter/out/firestore/order_collection_adapter.dart';
import 'package:egg_app/domain/core/module_container.dart';
import 'package:egg_app/domain/enum/order_status_enum.dart';
import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';


Future<void> main() async {
  final instance = FakeFirebaseFirestore();
  final snapshot = instance.collection('order');
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  OrderCollectionAdapter orderAdapter = OrderCollectionAdapter(snapshot);
  testWidgets('Order gets saved', (tester) async {
    Order order = Order([Egg()]);
    order.userId = "asdqwe123";
    await orderAdapter.saveOrder(order);
    expect(orderAdapter, isNotNull);
    expect(order.status, equals(OrderStatus.placed));
    var collectionReference = await snapshot.get();
  });
}