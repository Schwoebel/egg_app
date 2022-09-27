import 'package:clock/clock.dart';
import 'package:eggp_app/domain/model/user.dart';

class Order{
  int eggCount;
  final User orderer;
  bool complete = false;
  late final DateTime createdTime;
  Order(this.orderer, this.eggCount){
    createdTime = clock.now();
  }
  void setEggCount(int i) {
    eggCount = i;
  }
  int getEggCount(){
    return eggCount;
  }

  User getOrderer() {
    return orderer;
  }

  isComplete() {
    return complete;
  }

  void toggleComplete() {
    complete = !complete;
  }

  DateTime getCreatedTime() {
    return createdTime;
  }
}