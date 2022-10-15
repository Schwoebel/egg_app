import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egg_app/domain/model/order.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:mockito/annotations.dart';
import 'package:egg_app/adapter/out/firestore/order_collection_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'order_colllection_adapter_test.mocks.dart';

@GenerateMocks([FirebaseFirestore])
@GenerateNiceMocks([MockSpec<Order>()])
void main() {
  test("Can be created", () {
    FakeFirebaseFirestore fakeFirebaseFirestore =  FakeFirebaseFirestore();
    OrderCollectionAdapter orderAdapter = OrderCollectionAdapter(fakeFirebaseFirestore.collection('orders'));
    MockOrder order = MockOrder();
    orderAdapter.saveOrder(order);
    verify(order.toJson());
  });
}

