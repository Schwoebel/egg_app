import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egg_app/adapter/out/firestore/order_collection_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../firebase_options.dart';

class ModuleContainer {
  Future<Injector> initialise(Injector injector) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    injector.map<FirebaseFirestore>((i) => FirebaseFirestore.instance, isSingleton:true);
    injector.map<OrderCollectionAdapter>(
            (i) => OrderCollectionAdapter(i.get<FirebaseFirestore>().collection('order')));
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