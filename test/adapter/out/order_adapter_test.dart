import 'package:egg_app/adapter/out/order_adapter.dart';
import 'package:egg_app/application/ports/out/order_port.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Can be created", () {
    OrderAdapter orderAdapter = OrderAdapter();
    expect(orderAdapter, isInstanceOf<OrderPort>());
  });
}

