import 'package:eggp_app/adapter/out/order_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ModuleContainer {
  Injector initialise(Injector injector) {

    injector.map<FirebaseApp>((i) => Firebase.app(), isSingleton:true);
    injector.map<OrderAdapter>(
            (i) => OrderAdapter());
   /**
    injector.map<String>((i) => 'https://api.com/', key: 'apiUrl');
    injector.map<Firebase>((i) => i.get<Firebase>())
    injector.map<SomeType>((injector) => SomeType('0'));
    injector.map<SomeType>((injector) => SomeType('1'), key: 'One');
    injector.map<SomeType>((injector) => SomeType('2'), key: 'Two');

    injector.mapWithParams<SomeOtherType>((i, p) => SomeOtherType(p['id']));
    injector.map<OrderPort>((i) => OrderAdapter(), isSingleton: true);
    **/
    return injector;
  }
}