import 'package:clock/clock.dart';
import 'package:eggp_app/domain/model/user.dart';

class Order{
  int eggCount;
  final User orderer;
  bool isComplete = false;
  late final DateTime createdTime;
  late bool placed;
  Order(this.orderer, this.eggCount){
    createdTime = clock.now();
    placed = false;
  }

  void toggleComplete() {
    isComplete = !isComplete;
  }

}