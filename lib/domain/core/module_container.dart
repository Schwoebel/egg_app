import 'package:egg_app/adapter/out/order_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../firebase_options.dart';

class ModuleContainer {
  Future<Injector> initialise(Injector injector) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    injector.map<FirebaseDatabase>((i) => FirebaseDatabase.instance, isSingleton:true);
    injector.map<OrderAdapter>(
            (i) => OrderAdapter(i.get<FirebaseDatabase>()));
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