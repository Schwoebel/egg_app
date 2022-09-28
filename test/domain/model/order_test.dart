import 'package:clock/clock.dart';
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Order", (){
    Order? order;
    User user;
    setUp((){
      ContactDetails contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com","0735334287");
      user = User(contactDetails, "asdqwe123");
      order = Order(user, 0);
    });

    test("should Instantiate an Order", (){
      expect(order, isInstanceOf<Order>());
    });

    test("should have an orderer", (){
      expect(order?.orderer, isInstanceOf<User>());
    });

    test("should have at eggCount", (){
      order?.eggCount = 1;
      expect(order?.eggCount, equals(1));
    });

    test("should be marked complete", (){
      expect(order?.isComplete, equals(false));
    });

    test("complete should be togglable", (){
      order?.toggleComplete();
      expect(order?.isComplete, equals(true));
    });

    test("should have a createTime", (){
      expect(order?.createdTime.minute, equals(const Clock().now().minute));
    });
  });
}
