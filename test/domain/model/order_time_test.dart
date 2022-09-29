
import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:eggp_app/domain/model/order.dart';
import 'package:eggp_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Order placing", (){
    Order? order;
    User user;
    setUp((){
      ContactDetails contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com","0735334287");
      user = User(contactDetails, "asdqwe123");
      order = Order(user, 0);
    });
    test("Orders cannot be placed", (){

    });

    test("Orders can be placed", (){

    });

    test("Order was created, but wasn't submitted in time", (){

    });

    test("Order was created and submitted on time", (){

    });

    test("Order will be delivered today", (){

    });
    test("Order will be delivered tomorrow", (){

    });
  });

}
